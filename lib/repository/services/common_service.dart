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
import 'package:flutter_music/sections/search/models/search_recommend.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
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
import 'package:flutter_music/utils/search_util.dart';

class CommonService {
  ///首页数据
  static Future<HomeMusicWrap?> getHomeDataSouce({bool refresh = false}) async {
    if (DebugUtils.debug) {
      return _jsonDecode(JsonStringConstants.discorver_block_page)
          .then((value) => HomeMusicWrap.fromJson(value));
    }

    return await ServiceHelper.post(MusicUri.home(refresh: refresh),
            options: ServiceHelper.buildCacheOption(
                Duration(days: 3), "home_music_cache"))
        .then((value) => HomeMusicWrap.fromJson(value));
  }

  ///游客体验模式
  static Future<Response> visitorLogin() async {
    return await Dio().get(UrlConstants.baseUrl + MusicUri.visitorLogin);
  }

  ///验证手机号
  static Future<VerifyPhoneModel> verifyPhone(String phone) async =>
      ServiceHelper.get(MusicUri.verifyPhone(phone))
          .then((value) => VerifyPhoneModel.fromJson(value));

  ///发送验证码
  static Future<SimpleModel> sendCaptcha(String phone) async =>
      ServiceHelper.get(MusicUri.sendCaptcha(phone))
          .then((value) => SimpleModel.fromJson(value));

  ///邮箱登录
  static Future<EmailLoginMode> emailLogin(
      String email, String password) async {
    if (DebugUtils.debug) {
      return _jsonDecode(JsonStringConstants.email_login)
          .then((json) => EmailLoginMode.fromJson(json));
    }

    return ServiceHelper.get(MusicUri.emailLogin(email, password))
        .then((value) => EmailLoginMode.fromJson(value));
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

  ///刷新登录
  static Future<EmailLoginMode> refreshLogin() =>
      ServiceHelper.get(MusicUri.refreshLogin)
          .then((value) => EmailLoginMode.fromJson(value));

  ///获取每日推荐歌曲
  static Future<RecommendListWrap> getRecommendListMusic() async {
    if (DebugUtils.debug) {
      return _jsonDecode(JsonStringConstants.recommend_songs)
          .then((value) => RecommendListWrap.fromJson(value));
    }
    return ServiceHelper.get(MusicUri.recommend_songs)
        .then((value) => RecommendListWrap.fromJson(value));
  }

  ///每日推荐歌单
  static Future<SquareEveryDayRecommendWrap> getRecommendResource() async {
    if (DebugUtils.debug) {
      return _jsonDecode(JsonStringConstants.recommend_resource)
          .then((value) => SquareEveryDayRecommendWrap.fromJson(value));
    }
    return ServiceHelper.get(MusicUri.recommend_resource)
        .then((value) => SquareEveryDayRecommendWrap.fromJson(value));
  }

  ///推荐歌单
  static Future<SquareRecommendWrap> getRecommendPersonalized(
      {int limit = 6}) async {
    if (DebugUtils.debug) {
      return _jsonDecode(JsonStringConstants.recommend_personalized)
          .then((value) => SquareRecommendWrap.fromJson(value));
    }
    return ServiceHelper.get(MusicUri.recommend_personalized(limit: limit))
        .then((value) => SquareRecommendWrap.fromJson(value));
  }

  ///歌单分类
  static Future<CatlistWrap> getCatlist() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.catlist_all)
          .then((value) => CatlistWrap.fromJson(value));
    }
    return await ServiceHelper.get(MusicUri.catlist,
            options: ServiceHelper.buildCacheOption(
                Duration(days: 3), MusicUri.catlist))
        .then((value) => CatlistWrap.fromJson(value));
  }

  ///获取歌曲url
  static Future<SongWrap?> getSongUrl(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.song_url)
          .then((value) => SongWrap.fromJson(value));
    }
    return await ServiceHelper.get(MusicUri.song_url(id)).then((value) {
      print(">>>>>>>>value:$value");
      return SongWrap.fromJson(value);
    }).catchError((e) {
      print(">>>>>>>>>>>>>.error:$e");
    });
  }

  ///获取歌曲歌词
  static Future<SongLyric?> getSongLyric(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.song_lyric)
          .then((value) => SongLyric.fromJson(value));
    }
    return await ServiceHelper.get(MusicUri.song_lyric(id)).then((value) {
      print(">>>>>>>>value:$value");
      return SongLyric.fromJson(value);
    }).catchError((e) {
      print(">>>>>>>>>>>>>.error:$e");
    });
  }

  ///热门歌单分类
  static Future<SquareHotWrap> getHotCategory() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.hot_catlist)
          .then((value) => SquareHotWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.hot,
            options:
                ServiceHelper.buildCacheOption(Duration(days: 3), MusicUri.hot))
        .then((value) => SquareHotWrap.fromJson(value));
  }

  ///歌单列表（网友精选碟）
  static Future<PlaylistSquareWrap> getSongPlaylist(
      {int limit = 10,
      int offset = 0,
      String order = "hot",
      String tag = "全部"}) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.square_all)
          .then((value) => PlaylistSquareWrap.fromJson(value));
    }

    return await ServiceHelper.get(
            MusicUri.getSongPlayList(
                limit: limit, offset: offset, order: order, tag: tag),
            options: ServiceHelper.buildCacheOption(
                Duration(days: 3),
                MusicUri.getSongPlayList(
                    limit: limit, offset: offset, order: order, tag: tag)))
        .then((value) => PlaylistSquareWrap.fromJson(value));
  }

  ///歌单列表，精品页数据
  static Future<PlaylistSquareWrap> getHighqualityPlayList(
      {int limit = 10, int before = 0, String cat = ""}) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.highquality_tags)
          .then((value) => PlaylistSquareWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.getHighqualityPlayList(
            limit: limit, before: before, cat: cat))
        .then((value) => PlaylistSquareWrap.fromJson(value));
  }

  ///歌单列表，精品页标签列表
  static Future<HighqualityTagsWrap> getHighqualityTagsList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.highquality_list)
          .then((value) => HighqualityTagsWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.highquality_tags)
        .then((value) => HighqualityTagsWrap.fromJson(value));
  }

  ///歌单详情
  static Future<PlaylistSquareWrap> getPlaylistDetil(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.playlist_detail)
          .then((value) => PlaylistSquareWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.getPlaylistDetail(id))
        .then((value) => PlaylistSquareWrap.fromJson(value));
  }

  ///排行榜
  static Future<LeaderboardWrap> getToplistDetail() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.toplist_detail)
          .then((value) => LeaderboardWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.toplist_detail)
        .then((value) => LeaderboardWrap.fromJson(value));
  }

  ///电台-推荐
  static Future<PodcastWrap> getDJCategoryRecommendList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.dj_category_recommend)
          .then((value) => PodcastWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.dj_recommend_category)
        .then((value) => PodcastWrap.fromJson(value));
  }

  ///电台-电台今日优选
  static Future<PersonalizeWrap> getDJTodayRecommend() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.dj_recommend)
          .then((value) => PersonalizeWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.dj_recommend)
        .then((value) => PersonalizeWrap.fromJson(value));
  }

  ///电台-banner
  static Future<PodcastBannerWrap> getDJBanner() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.dj_banner)
          .then((value) => PodcastBannerWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.dj_banner)
        .then((value) => PodcastBannerWrap.fromJson(value));
  }

  /// 电台 - 全部分类
  static Future<CatelistWrap> getDJCatelist() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.dj_catelist)
          .then((value) => CatelistWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.dj_catelist)
        .then((value) => CatelistWrap.fromJson(value));
  }

  /// 电台 - 全部分类下的数据
  static Future<CatelistRecommendWrap> getDJCatelistRecommend(int type) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.dj_catelist_recommend)
          .then((value) => CatelistRecommendWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.dj_catelist_recommend(type))
        .then((value) => CatelistRecommendWrap.fromJson(value));
  }

  /// 电台 - 详情用户detail
  static Future<PodcastDetailWrap> getDJCatelistDetail(int rid) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.dj_catelist_detail)
          .then((value) => PodcastDetailWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.dj_catelist_detail(rid))
        .then((value) => PodcastDetailWrap.fromJson(value));
  }

  /// 电台 - 详情用户detail下的list
  static Future<PodcastDetailListWrap> getDJCatelistDetaillist(int rid) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.dj_catelist_detail_list)
          .then((value) => PodcastDetailListWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.dj_catelist_detail_list(rid))
        .then((value) => PodcastDetailListWrap.fromJson(value));
  }

  ///视频 - 标签列表
  static Future<VideoCategoryWrap> getVideoGroupList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_group)
          .then((value) => VideoCategoryWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.video_group)
        .then((value) => VideoCategoryWrap.fromJson(value));
  }

  ///视频 - 分类列表
  static Future<VideoCategoryWrap> getVideoCategoryList() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_category)
          .then((value) => VideoCategoryWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.video_category)
        .then((value) => VideoCategoryWrap.fromJson(value));
  }

  ///视频 - 获取视频标签/分类下的视频
  static Future<VideoSourceWrap?> getVideoGroupListSource(int id,
      {int offset = 0}) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_group_source)
          .then((value) => VideoSourceWrap.fromJson(value));
    }

    return await ServiceHelper.get(
            MusicUri.video_group_source(id, offset: offset))
        .then((value) => VideoSourceWrap.fromJson(value));
  }

  ///视频 - 获取视频详情
  static Future<VideoDetailWrap?> getVideoDetail(String id) async {
    print(">>>>>>>>>>id:$id");
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_detail)
          .then((value) => VideoDetailWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.video_detail(id))
        .then((value) => VideoDetailWrap.fromJson(value));
  }

  ///视频 - 获取视频Url,url有大概1个小时的有效期，过期需要重新获取链接，可以通过自己拼接链接去safari上获取json中的url进行播放
  static Future<VideoUrlWrap?> getVideoUrl(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_url)
          .then((value) => VideoUrlWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.video_url(id))
        .then((value) => VideoUrlWrap.fromJson(value));
  }

  ///视频 - 获取视频点赞转发评论数数据
  static Future<VideoDetailInfoWrap?> getVideoDetailInfo(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_detail_info)
          .then((value) => VideoDetailInfoWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.video_detail_info(id))
        .then((value) => VideoDetailInfoWrap.fromJson(value));
  }

  ///视频 - 获取视频评论
  static Future<VideoCommentWrap?> getVideoComment(String id) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.video_comment)
          .then((value) => VideoCommentWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.video_comment(id))
        .then((value) => VideoCommentWrap.fromJson(value));
  }

  ///搜索 - 关键词
  static Future<SearchDefaultWrap?> getSearchDefaultWord() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.search_deault)
          .then((value) => SearchDefaultWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.search_default)
        .then((value) => SearchDefaultWrap.fromJson(value));
  }

  ///搜索 - 热搜榜
  static Future<SearchHotWrap?> getSearchHotData() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.search_hot_detail)
          .then((value) => SearchHotWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.search_hot_detail)
        .then((value) => SearchHotWrap.fromJson(value));
  }

  ///搜索 - 话题榜
  static Future<SearchHotTopicWrap?> getSearchHotTopic() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.search_hot_topic)
          .then((value) => SearchHotTopicWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.search_hot_topic)
        .then((value) => SearchHotTopicWrap.fromJson(value));
  }

  ///搜索 - 推荐列表
  static Future<SearchRecommendWrap?> getSearchRecommendHot() async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.search_recommend)
          .then((value) => SearchRecommendWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.search_recommend)
        .then((value) => SearchRecommendWrap.fromJson(value));
  }

  ///搜索 - 详情
  static Future<SearchResultWrap?> getSearchDetail(
      String keywords, int type) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.search_detail)
          .then((value) => SearchResultWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.search_detail(keywords, type: type))
        .then((value) => SearchResultWrap.fromJson(value));
  }

  ///搜索 - 详情 - 分类数据
  static Future<SearchResultWrap?> getSearchDetailCategory(
      String keywords, int type) async {
    if (DebugUtils.debug) {
      String jsonStr = "";
      if (type == SearchUtils.single) {
        jsonStr = JsonStringConstants.search_detail_single;
      } else if (type == SearchUtils.song_list) {
        jsonStr = JsonStringConstants.search_detail_playlist;
      } else if (type == SearchUtils.album) {
        jsonStr = JsonStringConstants.search_detail_album;
      } else if (type == SearchUtils.singer) {
        jsonStr = JsonStringConstants.search_detail_singer;
      } else if (type == SearchUtils.user) {
        jsonStr = JsonStringConstants.search_detail_user;
      } else if (type == SearchUtils.lyric) {
        jsonStr = JsonStringConstants.search_detail_lyric;
      } else if (type == SearchUtils.video) {
        jsonStr = JsonStringConstants.search_detail_video;
      }
//      print(">>>>>>>>>type:$type  ...json:$jsonStr");
      return await _jsonDecode(jsonStr)
          .then((value) => SearchResultWrap.fromJson(value));
    }

    return await ServiceHelper.get(MusicUri.search_detail(keywords, type: type))
        .then((value) => SearchResultWrap.fromJson(value));
  }

  ///搜索 - 歌手分类
  static Future<SearchSingerCategoryWrap?> getSearchSingerCategory(
      int type, int area) async {
    if (DebugUtils.debug) {
      return await _jsonDecode(JsonStringConstants.search_singer_category)
          .then((value) => SearchSingerCategoryWrap.fromJson(value));
    }
    return await ServiceHelper.get(MusicUri.singer_category(type, area))
        .then((value) => SearchSingerCategoryWrap.fromJson(value));
  }
}
