import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_music/constants/url.dart';
import 'package:flutter_music/helper/user.dart';
//import 'package:flutter_wanandroid/helper/user.dart';

class ServiceHelper {
  static final Dio _dio = Dio(BaseOptions(
      baseUrl: UrlConstants.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      contentType: "application/x-www-form-urlencoded; charset=utf-8"));

  static Future<T> post<T>(
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio
        .post<T>(path,
            options: options ?? _getOptions(),
            data: data,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((value) => value.data!);
  }

  static Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio
        .get<T>(path,
            queryParameters: queryParameters,
            options: options ?? _getOptions(),
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress)
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
    return _dio.download(urlPath!, savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        lengthHeader: lengthHeader,
        data: data,
        options: options);
  }

  static Future<T> upload<T>(String urlPath, Map<String, dynamic> data) {
    var formData = FormData.fromMap(data);
    return _dio.post<T>(urlPath, data: formData).then((value) => value.data!);
  }

  static Options? _getOptions() {
    Map<String, String>? map = UserDefault.getHeader();
    if (map != null) {
      return Options(headers: map);
    } else {
      return null;
    }
  }

  static Options? buildCacheOption(Duration duration, String cacheKey) {
    return buildCacheOptions(duration,
        subKey: cacheKey, options: _getOptions());
  }
}
