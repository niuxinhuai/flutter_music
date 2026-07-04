import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music/constants/json.dart';
import 'package:flutter_music/constants/url.dart';
import 'package:flutter_music/helper/service_helper.dart';
import 'package:flutter_music/models/simple_model.dart';
import 'package:flutter_music/sections/Leaderboard/models/leaderboard.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/login/models/login.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/music/models/song.dart';
import 'package:flutter_music/sections/podcast/models/banner.dart';
import 'package:flutter_music/sections/podcast/models/catelist.dart';
import 'package:flutter_music/sections/podcast/models/detail.dart';
import 'package:flutter_music/sections/podcast/models/detail_list.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/sections/search/models/search_default.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'package:flutter_music/sections/search/models/search_hot_topic.dart';
import 'package:flutter_music/sections/search/models/search_multimatch.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/models/search_voice.dart';
import 'package:flutter_music/sections/search/models/singer_category.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';
import 'package:flutter_music/sections/square/models/square.dart';
import 'package:flutter_music/sections/square/models/tag.dart';
import 'package:flutter_music/sections/video/models/comment.dart';
import 'package:flutter_music/sections/video/models/detail.dart';
import 'package:flutter_music/sections/video/models/info.dart';
import 'package:flutter_music/sections/video/models/url.dart';
import 'package:flutter_music/sections/village/models/category.dart';
import 'package:flutter_music/sections/village/models/source.dart';
import 'package:flutter_music/utils/debug_util.dart';
import 'package:flutter_music/utils/image_url_utils.dart';
import 'package:flutter_music/utils/netease_weapi.dart';
import 'package:flutter_music/utils/search_util.dart';

class CommonService {
  ///首页数据
  static Future<HomeMusicWrap?> getHomeDataSouce({bool refresh = false}) async {
    if (DebugUtils.debug) {
      return _getMockHomeDataSource();
    }

    try {
      return await ServiceHelper.post(
        MusicUri.home(refresh: refresh),
        options: ServiceHelper.buildCacheOption(
          Duration(days: 3),
          "home_music_cache",
        ),
      ).then((value) => HomeMusicWrap.fromJson(value));
    } catch (e) {
      print(">>>>>>>>>home api error, fallback to mock data:$e");
      return _getMockHomeDataSource();
    }
  }

  static Future<HomeMusicWrap> _getMockHomeDataSource() {
    return _jsonDecode(
      JsonStringConstants.discorver_block_page,
    ).then((value) => HomeMusicWrap.fromJson(value));
  }

  ///游客体验模式
  static Future<Response> visitorLogin() async {
    return await Dio().get(UrlConstants.baseUrl + MusicUri.visitorLogin);
  }

  ///验证手机号
  static Future<VerifyPhoneModel> verifyPhone(String phone) async =>
      ServiceHelper.get(
        MusicUri.verifyPhone(phone),
      ).then((value) => VerifyPhoneModel.fromJson(value));

  ///发送验证码
  static Future<SimpleModel> sendCaptcha(String phone) async =>
      ServiceHelper.get(
        MusicUri.sendCaptcha(phone),
      ).then((value) => SimpleModel.fromJson(value));

  ///邮箱登录
  static Future<EmailLoginMode> emailLogin(
    String email,
    String password,
  ) async {
    if (DebugUtils.debug) {
      return _jsonDecode(
        JsonStringConstants.email_login,
      ).then((json) => EmailLoginMode.fromJson(json));
    }

    return ServiceHelper.get(
      MusicUri.emailLogin(email, password),
    ).then((value) => EmailLoginMode.fromJson(value));
  }

  static Future<Map<String, dynamic>> _jsonDecode(String path) async {
    return await rootBundle.loadString(path).then((value) {
      Map<String, dynamic> map = json.decode(value);
      return map;
    });
    //    return await Future.value(value)
    //        .then((sb) => jsonDecode(sb))
    //        .then((json) => json);
  }

  static Future<T> _requestWithMockFallback<T>({
    required Future<T> Function() request,
    required String mockPath,
    required T Function(Map<String, dynamic>) fromJson,
    required int? Function(T) codeOf,
    required String logName,
  }) async {
    try {
      T result = await request();
      if (codeOf(result) == 200) {
        return result;
      }
    } catch (e) {
      print(">>>>>>>>>$logName api error, fallback to mock data:$e");
    }
    return _jsonDecode(mockPath).then((value) => fromJson(value));
  }

  static String _searchDetailMockPath(int type) {
    if (type == SearchUtils.single) {
      return JsonStringConstants.search_detail_single;
    } else if (type == SearchUtils.song_list) {
      return JsonStringConstants.search_detail_playlist;
    } else if (type == SearchUtils.album) {
      return JsonStringConstants.search_detail_album;
    } else if (type == SearchUtils.singer) {
      return JsonStringConstants.search_detail_singer;
    } else if (type == SearchUtils.user) {
      return JsonStringConstants.search_detail_user;
    } else if (type == SearchUtils.lyric) {
      return JsonStringConstants.search_detail_lyric;
    } else if (type == SearchUtils.video) {
      return JsonStringConstants.search_detail_video;
    } else if (type == SearchUtils.voice) {
      return JsonStringConstants.search_detail_voice;
    }
    return JsonStringConstants.search_detail;
  }

  static void _normalizePlaylistDetail(Map value) {
    if (value["playlist"] == null && value["result"] != null) {
      value["playlist"] = value["result"];
    }

    final playlist = value["playlist"];
    if (playlist is! Map) {
      return;
    }

    final tracks = playlist["tracks"];
    if (tracks is List) {
      playlist["trackIds"] ??= tracks
          .whereType<Map>()
          .map((track) => <String, dynamic>{"id": track["id"]})
          .toList();

      for (final track in tracks.whereType<Map>()) {
        track["al"] ??= track["album"];
        track["ar"] ??= track["artists"];
        track["alia"] ??= track["alias"];
        track["mv"] ??= track["mvid"];
      }
    }
  }

  static void _normalizeRecommendPlayCount(Map value) {
    void normalizeItem(dynamic item) {
      if (item is! Map) {
        return;
      }
      final playCount = item["playCount"];
      if (playCount is num) {
        item["playCount"] = playCount.toInt();
      }
      final playcount = item["playcount"];
      if (playcount is num) {
        item["playcount"] = playcount.toInt();
      }
    }

    final result = value["result"];
    if (result is List) {
      result.forEach(normalizeItem);
    }
    final recommend = value["recommend"];
    if (recommend is List) {
      recommend.forEach(normalizeItem);
    }
  }

  static void _normalizeVideoUrl(Map value) {
    final urls = value["urls"];
    if (urls is! List || urls.isEmpty) {
      value["urls"] = <Map<String, dynamic>>[];
      value["code"] = 200;
      return;
    }

    final first = urls.first;
    if (first is! Map) {
      return;
    }
    final url = first["url"];
    if (url is! String || url.isEmpty) {
      first["url"] = "";
      return;
    }
    final normalizedUrl = _normalizePlayableVideoUrl(url);
    if (normalizedUrl == null || normalizedUrl.isEmpty) {
      first["url"] = "";
    } else {
      first["url"] = normalizedUrl;
    }
  }

  static String? _normalizePlayableVideoUrl(String url) {
    var normalizedUrl = url.replaceAll("amp;", "");
    final uri = Uri.tryParse(normalizedUrl);
    if (uri == null) {
      return null;
    }
    final ts = int.tryParse(uri.queryParameters["ts"] ?? "");
    final nowSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (ts != null && ts < nowSeconds) {
      return null;
    }
    if (uri.scheme == "http" && uri.host.endsWith("vod.126.net")) {
      normalizedUrl = uri.replace(scheme: "https").toString();
    }
    return normalizedUrl;
  }

  static void _normalizeSongUrl(Map value) {
    final data = value["data"];
    if (data is! List) {
      return;
    }
    for (final item in data.whereType<Map>()) {
      final url = item["url"];
      if (url is String && url.isNotEmpty) {
        item["url"] = ImageUrlUtils.normalizeMusicMediaUrl(url);
      }
    }
  }

  ///刷新登录
  static Future<EmailLoginMode> refreshLogin() => ServiceHelper.get(
    MusicUri.refreshLogin,
  ).then((value) => EmailLoginMode.fromJson(value));

  ///获取每日推荐歌曲
  static Future<RecommendListWrap> getRecommendListMusic() async {
    if (DebugUtils.debug) {
      return _jsonDecode(
        JsonStringConstants.recommend_songs,
      ).then((value) => RecommendListWrap.fromJson(value));
    }
    try {
      RecommendListWrap wrap = await ServiceHelper.get(
        MusicUri.recommend_songs,
      ).then((value) => RecommendListWrap.fromJson(value));
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>recommend songs api error, fallback to mock data:$e");
    }
    return _jsonDecode(
      JsonStringConstants.recommend_songs,
    ).then((value) => RecommendListWrap.fromJson(value));
  }

  ///每日推荐歌单
  static Future<SquareEveryDayRecommendWrap> getRecommendResource() async {
    if (DebugUtils.debug) {
      return _jsonDecode(
        JsonStringConstants.recommend_resource,
      ).then((value) => SquareEveryDayRecommendWrap.fromJson(value));
    }
    try {
      SquareEveryDayRecommendWrap wrap =
          await ServiceHelper.get(MusicUri.recommend_resource).then((value) {
            if (value is Map) {
              _normalizeRecommendPlayCount(value);
            }
            return SquareEveryDayRecommendWrap.fromJson(value);
          });
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>recommend resource api error, fallback to mock data:$e");
    }
    return _jsonDecode(
      JsonStringConstants.recommend_resource,
    ).then((value) => SquareEveryDayRecommendWrap.fromJson(value));
  }

  ///推荐歌单
  static Future<SquareRecommendWrap> getRecommendPersonalized({
    int limit = 6,
  }) async {
    if (DebugUtils.debug) {
      return _jsonDecode(
        JsonStringConstants.recommend_personalized,
      ).then((value) => SquareRecommendWrap.fromJson(value));
    }
    try {
      SquareRecommendWrap wrap =
          await ServiceHelper.get(
            MusicUri.recommend_personalized(limit: limit),
          ).then((value) {
            if (value is Map) {
              _normalizeRecommendPlayCount(value);
            }
            return SquareRecommendWrap.fromJson(value);
          });
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(
        ">>>>>>>>>recommend personalized api error, fallback to mock data:$e",
      );
    }
    return _jsonDecode(
      JsonStringConstants.recommend_personalized,
    ).then((value) => SquareRecommendWrap.fromJson(value));
  }

  ///歌单分类
  static Future<CatlistWrap> getCatlist() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.catlist_all,
      ).then((value) => CatlistWrap.fromJson(value));
    }
    try {
      CatlistWrap wrap = await ServiceHelper.get(
        MusicUri.catlist,
        options: ServiceHelper.buildCacheOption(
          Duration(days: 3),
          MusicUri.catlist,
        ),
      ).then((value) => CatlistWrap.fromJson(value));
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>catlist api error, fallback to mock data:$e");
    }
    return await _jsonDecode(
      JsonStringConstants.catlist_all,
    ).then((value) => CatlistWrap.fromJson(value));
  }

  ///获取歌曲url
  static Future<SongWrap?> getSongUrl(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.song_url).then((value) {
        _normalizeSongUrl(value);
        return SongWrap.fromJson(value);
      });
    }
    try {
      final value = await ServiceHelper.get(MusicUri.song_url(id));
      if (value is Map) {
        _normalizeSongUrl(value);
      }
      return SongWrap.fromJson(value);
    } catch (e) {
      print(">>>>>>>>>>>>>.error:$e");
      return null;
    }
  }

  ///获取歌曲歌词
  static Future<SongLyric?> getSongLyric(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.song_lyric,
      ).then((value) => SongLyric.fromJson(value));
    }
    try {
      final value = await ServiceHelper.get(MusicUri.song_lyric(id));
      return SongLyric.fromJson(value);
    } catch (e) {
      print(">>>>>>>>>>>>>.error:$e");
      return null;
    }
  }

  ///热门歌单分类
  static Future<SquareHotWrap> getHotCategory() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.hot_catlist,
      ).then((value) => SquareHotWrap.fromJson(value));
    }

    try {
      SquareHotWrap wrap = await ServiceHelper.get(
        MusicUri.hot,
        options: ServiceHelper.buildCacheOption(
          Duration(days: 3),
          MusicUri.hot,
        ),
      ).then((value) => SquareHotWrap.fromJson(value));
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>hot category api error, fallback to mock data:$e");
    }
    return await _jsonDecode(
      JsonStringConstants.hot_catlist,
    ).then((value) => SquareHotWrap.fromJson(value));
  }

  ///歌单列表（网友精选碟）
  static Future<PlaylistSquareWrap> getSongPlaylist({
    int limit = 10,
    int offset = 0,
    String order = "hot",
    String tag = "全部",
  }) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.square_all,
      ).then((value) => PlaylistSquareWrap.fromJson(value));
    }

    try {
      PlaylistSquareWrap wrap = await ServiceHelper.get(
        MusicUri.getSongPlayList(
          limit: limit,
          offset: offset,
          order: order,
          tag: tag,
        ),
        options: ServiceHelper.buildCacheOption(
          Duration(days: 3),
          MusicUri.getSongPlayList(
            limit: limit,
            offset: offset,
            order: order,
            tag: tag,
          ),
        ),
      ).then((value) => PlaylistSquareWrap.fromJson(value));
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>song playlist api error, fallback to mock data:$e");
    }
    return await _jsonDecode(
      JsonStringConstants.square_all,
    ).then((value) => PlaylistSquareWrap.fromJson(value));
  }

  ///歌单列表，精品页数据
  static Future<PlaylistSquareWrap> getHighqualityPlayList({
    int limit = 10,
    int before = 0,
    String cat = "",
  }) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.highquality_tags,
      ).then((value) => PlaylistSquareWrap.fromJson(value));
    }

    try {
      PlaylistSquareWrap wrap = await ServiceHelper.get(
        MusicUri.getHighqualityPlayList(limit: limit, before: before, cat: cat),
      ).then((value) => PlaylistSquareWrap.fromJson(value));
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(
        ">>>>>>>>>highquality playlist api error, fallback to mock data:$e",
      );
    }
    return await _jsonDecode(
      JsonStringConstants.highquality_tags,
    ).then((value) => PlaylistSquareWrap.fromJson(value));
  }

  ///歌单列表，精品页标签列表
  static Future<HighqualityTagsWrap> getHighqualityTagsList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.highquality_list,
      ).then((value) => HighqualityTagsWrap.fromJson(value));
    }

    try {
      HighqualityTagsWrap wrap = await ServiceHelper.get(
        MusicUri.highquality_tags,
      ).then((value) => HighqualityTagsWrap.fromJson(value));
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>highquality tags api error, fallback to mock data:$e");
    }
    return await _jsonDecode(
      JsonStringConstants.highquality_list,
    ).then((value) => HighqualityTagsWrap.fromJson(value));
  }

  ///歌单详情
  static Future<PlaylistSquareWrap> getPlaylistDetil(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.playlist_detail,
      ).then((value) => PlaylistSquareWrap.fromJson(value));
    }

    try {
      PlaylistSquareWrap wrap =
          await ServiceHelper.get(MusicUri.getPlaylistDetail(id)).then((value) {
            if (value is Map) {
              _normalizePlaylistDetail(value);
            }
            return PlaylistSquareWrap.fromJson(value);
          });
      if (wrap.code == 200 && wrap.playlist != null) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>playlist detail api error, fallback to mock data:$e");
    }
    return await _jsonDecode(
      JsonStringConstants.playlist_detail,
    ).then((value) => PlaylistSquareWrap.fromJson(value));
  }

  ///排行榜
  static Future<LeaderboardWrap> getToplistDetail() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.toplist_detail,
      ).then((value) => LeaderboardWrap.fromJson(value));
    }

    try {
      LeaderboardWrap wrap = await ServiceHelper.get(
        MusicUri.toplist_detail,
      ).then((value) => LeaderboardWrap.fromJson(value));
      if (wrap.code == 200) {
        return wrap;
      }
    } catch (e) {
      print(">>>>>>>>>toplist detail api error, fallback to mock data:$e");
    }
    return await _jsonDecode(
      JsonStringConstants.toplist_detail,
    ).then((value) => LeaderboardWrap.fromJson(value));
  }

  ///电台-推荐
  static Future<PodcastWrap> getDJCategoryRecommendList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.dj_category_recommend,
      ).then((value) => PodcastWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.dj_recommend_category,
      ).then((value) => PodcastWrap.fromJson(value)),
      mockPath: JsonStringConstants.dj_category_recommend,
      fromJson: (value) => PodcastWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "dj category recommend",
    );
  }

  ///电台-电台今日优选
  static Future<PersonalizeWrap> getDJTodayRecommend() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.dj_recommend,
      ).then((value) => PersonalizeWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.dj_recommend,
      ).then((value) => PersonalizeWrap.fromJson(value)),
      mockPath: JsonStringConstants.dj_recommend,
      fromJson: (value) => PersonalizeWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "dj today recommend",
    );
  }

  ///电台-banner
  static Future<PodcastBannerWrap> getDJBanner() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.dj_banner,
      ).then((value) => PodcastBannerWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.dj_banner,
      ).then((value) => PodcastBannerWrap.fromJson(value)),
      mockPath: JsonStringConstants.dj_banner,
      fromJson: (value) => PodcastBannerWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "dj banner",
    );
  }

  /// 电台 - 全部分类
  static Future<CatelistWrap> getDJCatelist() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.dj_catelist,
      ).then((value) => CatelistWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.dj_catelist,
      ).then((value) => CatelistWrap.fromJson(value)),
      mockPath: JsonStringConstants.dj_catelist,
      fromJson: (value) => CatelistWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "dj catelist",
    );
  }

  /// 电台 - 全部分类下的数据
  static Future<CatelistRecommendWrap> getDJCatelistRecommend(int type) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.dj_catelist_recommend,
      ).then((value) => CatelistRecommendWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.dj_catelist_recommend(type),
      ).then((value) => CatelistRecommendWrap.fromJson(value)),
      mockPath: JsonStringConstants.dj_catelist_recommend,
      fromJson: (value) => CatelistRecommendWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "dj catelist recommend",
    );
  }

  /// 电台 - 详情用户detail
  static Future<PodcastDetailWrap> getDJCatelistDetail(int rid) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.dj_catelist_detail,
      ).then((value) => PodcastDetailWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.dj_catelist_detail(rid),
      ).then((value) => PodcastDetailWrap.fromJson(value)),
      mockPath: JsonStringConstants.dj_catelist_detail,
      fromJson: (value) => PodcastDetailWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "dj catelist detail",
    );
  }

  /// 电台 - 详情用户detail下的list
  static Future<PodcastDetailListWrap> getDJCatelistDetaillist(int rid) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.dj_catelist_detail_list,
      ).then((value) => PodcastDetailListWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.dj_catelist_detail_list(rid),
      ).then((value) => PodcastDetailListWrap.fromJson(value)),
      mockPath: JsonStringConstants.dj_catelist_detail_list,
      fromJson: (value) => PodcastDetailListWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "dj catelist detail list",
    );
  }

  ///视频 - 标签列表
  static Future<VideoCategoryWrap> getVideoGroupList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.video_group,
      ).then((value) => VideoCategoryWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.video_group,
      ).then((value) => VideoCategoryWrap.fromJson(value)),
      mockPath: JsonStringConstants.video_group,
      fromJson: (value) => VideoCategoryWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "video group",
    );
  }

  ///视频 - 分类列表
  static Future<VideoCategoryWrap> getVideoCategoryList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.video_category,
      ).then((value) => VideoCategoryWrap.fromJson(value));
    }

    return _requestWithMockFallback(
      request: () => ServiceHelper.get(
        MusicUri.video_category,
      ).then((value) => VideoCategoryWrap.fromJson(value)),
      mockPath: JsonStringConstants.video_category,
      fromJson: (value) => VideoCategoryWrap.fromJson(value),
      codeOf: (value) => value.code,
      logName: "video category",
    );
  }

  ///视频 - 获取视频标签/分类下的视频
  static Future<VideoSourceWrap?> getVideoGroupListSource(
    int id, {
    int offset = 0,
  }) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.video_group_source,
      ).then((value) => VideoSourceWrap.fromJson(value));
    }

    return _requestWithMockFallback<VideoSourceWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.video_group_source(id, offset: offset),
      ).then((value) => VideoSourceWrap.fromJson(value)),
      mockPath: JsonStringConstants.video_group_source,
      fromJson: (value) => VideoSourceWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "video group source",
    );
  }

  ///视频 - 获取视频详情
  static Future<VideoDetailWrap?> getVideoDetail(String id) async {
    print(">>>>>>>>>>id:$id");
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.video_detail,
      ).then((value) => VideoDetailWrap.fromJson(value));
    }

    return _requestWithMockFallback<VideoDetailWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.video_detail(id),
      ).then((value) => VideoDetailWrap.fromJson(value)),
      mockPath: JsonStringConstants.video_detail,
      fromJson: (value) => VideoDetailWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "video detail",
    );
  }

  ///视频 - 获取视频Url,url有大概1个小时的有效期，过期需要重新获取链接，可以通过自己拼接链接去safari上获取json中的url进行播放
  static Future<VideoUrlWrap?> getVideoUrl(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_url).then((value) {
        _normalizeVideoUrl(value);
        return VideoUrlWrap.fromJson(value);
      });
    }

    return _requestWithMockFallback<VideoUrlWrap?>(
      request: () => _getVideoUrlByWeApi(id).then((value) {
        _normalizeVideoUrl(value);
        return VideoUrlWrap.fromJson(value);
      }),
      mockPath: JsonStringConstants.video_url,
      fromJson: (value) {
        _normalizeVideoUrl(value);
        return VideoUrlWrap.fromJson(value);
      },
      codeOf: (value) => value?.code,
      logName: "video url",
    );
  }

  static Future<Map<String, dynamic>> _getVideoUrlByWeApi(String id) {
    return ServiceHelper.post<Map<String, dynamic>>(
      "https://music.163.com/weapi/cloudvideo/playurl?csrf_token=",
      data: NeteaseWeApi.encryptData(<String, dynamic>{
        "ids": "[\"$id\"]",
        "resolution": 1080,
        "csrf_token": "",
      }),
    );
  }

  ///视频 - 获取视频点赞转发评论数数据
  static Future<VideoDetailInfoWrap?> getVideoDetailInfo(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.video_detail_info,
      ).then((value) => VideoDetailInfoWrap.fromJson(value));
    }

    return _requestWithMockFallback<VideoDetailInfoWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.video_detail_info(id),
      ).then((value) => VideoDetailInfoWrap.fromJson(value)),
      mockPath: JsonStringConstants.video_detail_info,
      fromJson: (value) => VideoDetailInfoWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "video detail info",
    );
  }

  ///视频 - 获取视频评论
  static Future<VideoCommentWrap?> getVideoComment(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.video_comment,
      ).then((value) => VideoCommentWrap.fromJson(value));
    }

    return _requestWithMockFallback<VideoCommentWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.video_comment(id),
      ).then((value) => VideoCommentWrap.fromJson(value)),
      mockPath: JsonStringConstants.video_comment,
      fromJson: (value) => VideoCommentWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "video comment",
    );
  }

  ///搜索 - 关键词
  static Future<SearchDefaultWrap?> getSearchDefaultWord() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_deault,
      ).then((value) => SearchDefaultWrap.fromJson(value));
    }

    return _requestWithMockFallback<SearchDefaultWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_default,
      ).then((value) => SearchDefaultWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_deault,
      fromJson: (value) => SearchDefaultWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search default",
    );
  }

  ///搜索 - 热搜榜
  static Future<SearchHotWrap?> getSearchHotData() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_hot_detail,
      ).then((value) => SearchHotWrap.fromJson(value));
    }

    return _requestWithMockFallback<SearchHotWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_hot_detail,
      ).then((value) => SearchHotWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_hot_detail,
      fromJson: (value) => SearchHotWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search hot detail",
    );
  }

  ///搜索 - 话题榜
  static Future<SearchHotTopicWrap?> getSearchHotTopic() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_hot_topic,
      ).then((value) => SearchHotTopicWrap.fromJson(value));
    }

    return _requestWithMockFallback<SearchHotTopicWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_hot_topic,
      ).then((value) => SearchHotTopicWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_hot_topic,
      fromJson: (value) => SearchHotTopicWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search hot topic",
    );
  }

  ///搜索 - 推荐列表
  static Future<SearchRecommendWrap?> getSearchRecommendHot() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_recommend,
      ).then((value) => SearchRecommendWrap.fromJson(value));
    }

    return _requestWithMockFallback<SearchRecommendWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_recommend,
      ).then((value) => SearchRecommendWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_recommend,
      fromJson: (value) => SearchRecommendWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search recommend",
    );
  }

  ///搜索 - 详情
  static Future<SearchResultWrap?> getSearchDetail(
    String keywords,
    int type,
  ) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_detail,
      ).then((value) => SearchResultWrap.fromJson(value));
    }

    return _requestWithMockFallback<SearchResultWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_detail(keywords, type: type),
      ).then((value) => SearchResultWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_detail,
      fromJson: (value) => SearchResultWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search detail",
    );
  }

  ///搜索 - 详情 - 分类数据
  static Future<SearchResultWrap?> getSearchDetailCategory(
    String keywords,
    int type,
  ) async {
    if (DebugUtils.debug) {
      String jsonStr = _searchDetailMockPath(type);

      //      print(">>>>>>>>>type:$type  ...json:$jsonStr");
      return await _jsonDecode(
        jsonStr,
      ).then((value) => SearchResultWrap.fromJson(value));
    }

    return await _requestWithMockFallback<SearchResultWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_detail(keywords, type: type),
      ).then((value) => SearchResultWrap.fromJson(value)),
      mockPath: _searchDetailMockPath(type),
      fromJson: (value) => SearchResultWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search detail category",
    );
  }

  ///搜索 - 详情 - 声音
  static Future<SearchVoiceWrap?> getSearchDetailVoice(
    String keywords,
    int type,
  ) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_detail_voice,
      ).then((value) => SearchVoiceWrap.fromJson(value));
    }
    return _requestWithMockFallback<SearchVoiceWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_detail(keywords, type: type),
      ).then((value) => SearchVoiceWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_detail_voice,
      fromJson: (value) => SearchVoiceWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search detail voice",
    );
  }

  ///搜索 - 歌手分类
  static Future<SearchSingerCategoryWrap?> getSearchSingerCategory(
    int type,
    int area,
  ) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_singer_category,
      ).then((value) => SearchSingerCategoryWrap.fromJson(value));
    }
    return _requestWithMockFallback<SearchSingerCategoryWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.singer_category(type, area),
      ).then((value) => SearchSingerCategoryWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_singer_category,
      fromJson: (value) => SearchSingerCategoryWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search singer category",
    );
  }

  ///搜索 - 搜索多重匹配
  static Future<SearchMultimatchWrap?> getSearchMultimatch(
    String keyword,
  ) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(
        JsonStringConstants.search_multimatch,
      ).then((value) => SearchMultimatchWrap.fromJson(value));
    }
    return _requestWithMockFallback<SearchMultimatchWrap?>(
      request: () => ServiceHelper.get(
        MusicUri.search_multimatch(keyword),
      ).then((value) => SearchMultimatchWrap.fromJson(value)),
      mockPath: JsonStringConstants.search_multimatch,
      fromJson: (value) => SearchMultimatchWrap.fromJson(value),
      codeOf: (value) => value?.code,
      logName: "search multimatch",
    );
  }
}
