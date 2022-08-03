import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_music/constants/url.dart';
import 'package:flutter_music/helper/service_helper.dart';
import 'package:flutter_music/sections/home/models/home.dart';

class CommonService {
  ///首页数据
  static Future<HomeMusicWrap?> getHomeDataSouce({bool refresh = false}) =>
      ServiceHelper.post(MusicUri.home(refresh: refresh),
              options: buildCacheOptions(Duration(days: 3),
                  subKey: "home_music_cache"))
          .then((value) => HomeMusicWrap.fromJson(value));
}
