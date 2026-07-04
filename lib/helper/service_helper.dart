import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_music/constants/url.dart';
import 'package:flutter_music/helper/user.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
//import 'package:flutter_wanandroid/helper/user.dart';

class ServiceHelper {
  static const Map<String, String> _browserHeaders = {
    "User-Agent":
        "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148",
    "Referer": "https://music.163.com/",
    "Accept": "application/json, text/plain, */*",
  };

  static final CacheStore _cacheStore = FileCacheStore(_cacheDirectoryPath());

  static final CacheOptions _cacheOptions = CacheOptions(
    store: _cacheStore,
    hitCacheOnErrorCodes: const [500, 502, 503, 504],
    hitCacheOnNetworkFailure: true,
    allowPostMethod: true,
  );

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: UrlConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
    ),
  );

  static ServiceHelper? _instance;

  ServiceHelper._() {
    _dio.interceptors.add(DioCacheInterceptor(options: _cacheOptions));
  }

  static void _ensureInitialized() {
    _instance ??= ServiceHelper._();
  }

  static Future<T> post<T>(
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    _ensureInitialized();
    return _dio
        .post<T>(
          path,
          options: options ?? _getOptions(),
          data: data,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        )
        .then((value) => value.data!);
  }

  static Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    _ensureInitialized();
    return _dio
        .get<T>(
          path,
          queryParameters: queryParameters,
          options: options ?? _getOptions(),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        )
        .then((value) => value.data!);
  }

  static Future<Response> download(
    String? urlPath,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    lengthHeader = HttpHeaders.contentLengthHeader,
    data,
    Options? options,
  }) {
    _ensureInitialized();
    return _dio.download(
      urlPath!,
      savePath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      lengthHeader: lengthHeader,
      data: data,
      options: options,
    );
  }

  static Future<T> upload<T>(String urlPath, Map<String, dynamic> data) {
    _ensureInitialized();
    var formData = FormData.fromMap(data);
    return _dio.post<T>(urlPath, data: formData).then((value) => value.data!);
  }

  static Options _getOptions() {
    final headers = <String, String>{..._browserHeaders};
    final map = UserDefault.getHeader();
    if (map != null) {
      headers.addAll(map);
    }
    return Options(headers: headers);
  }

  static Options buildCacheOption(Duration duration, String cacheKey) {
    final cacheOptions = _cacheOptions.copyWith(
      maxStale: duration,
      keyBuilder: ({required url, headers, body}) {
        final keyUrl = Uri(
          scheme: 'flutter-music-cache',
          host: 'request',
          pathSegments: <String>[cacheKey, url.toString()],
        );
        return CacheOptions.defaultCacheKeyBuilder(
          url: keyUrl,
          headers: headers,
          body: body,
        );
      },
    );
    final options = _getOptions();
    return Options(
      headers: options.headers,
      extra: <String, dynamic>{...?options.extra, ...cacheOptions.toExtra()},
    );
  }

  static String _cacheDirectoryPath() {
    final directory = Directory(
      '${Directory.systemTemp.path}/flutter_music_http_cache',
    );
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    return directory.path;
  }
}
