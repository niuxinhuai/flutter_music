import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music/constants/json.dart';
import 'package:flutter_music/constants/url.dart';
import 'package:flutter_music/helper/service_helper.dart';
import 'package:flutter_music/helper/user.dart';
import 'package:flutter_music/models/simple_model.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/login/models/login.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/music/models/song.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/sections/square/models/square.dart';
import 'package:flutter_music/sections/square/models/tag.dart';
import 'package:flutter_music/utils/debug_util.dart';

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

  ///推荐歌单
  static Future<void> getRecommendSong() async {
    ServiceHelper.get(MusicUri.recommend_url,
            options: ServiceHelper.buildCacheOption(
                Duration(days: 3), "home_recommend_music_cache"))
        .then((value) {
      print(">>>>>>>>>>>>>valur:${value.runtimeType}  >>>>data:$value");
    }).catchError((e) {
      print(">>>>>>>请求失败:$e");
    });
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
  static Future<SongWrap> getSongUrl(String id) async {
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
  static Future<SongLyric> getSongLyric(String id) async {
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
}
