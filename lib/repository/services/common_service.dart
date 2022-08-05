import 'package:dio/dio.dart';
import 'package:flutter_music/constants/url.dart';
import 'package:flutter_music/helper/service_helper.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/sections/square/models/square.dart';

class CommonService {
  ///首页数据
  static Future<HomeMusicWrap?> getHomeDataSouce({bool refresh = false}) =>
      ServiceHelper.post(MusicUri.home(refresh: refresh),
              options: ServiceHelper.buildCacheOption(
                  Duration(days: 3), "home_music_cache"))
          .then((value) => HomeMusicWrap.fromJson(value));

  ///游客体验模式
  static Future<Response> visitorLogin() async {
    return await Dio().get(UrlConstants.baseUrl + MusicUri.visitorLogin);
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
  static Future<CatlistWrap> getCatlist() => ServiceHelper.get(MusicUri.catlist,
          options: ServiceHelper.buildCacheOption(
              Duration(days: 3), MusicUri.catlist))
      .then((value) => CatlistWrap.fromJson(value));

  ///热门歌单分类
  static Future<SquareHotWrap> getHotCategory() => ServiceHelper.get(
          MusicUri.hot,
          options:
              ServiceHelper.buildCacheOption(Duration(days: 3), MusicUri.hot))
      .then((value) => SquareHotWrap.fromJson(value));

  ///歌单列表（网友精选碟）
  static Future<PlaylistSquareWrap> getSongPlaylist(
          {int limit = 10,
          int offset = 0,
          String order = "hot",
          String tag = "全部"}) =>
      ServiceHelper.get(
              MusicUri.getSongPlayList(
                  limit: limit, offset: offset, order: order, tag: tag),
              options: ServiceHelper.buildCacheOption(
                  Duration(days: 3),
                  MusicUri.getSongPlayList(
                      limit: limit, offset: offset, order: order, tag: tag)))
          .then((value) => PlaylistSquareWrap.fromJson(value));
}
