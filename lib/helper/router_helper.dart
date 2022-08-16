import 'package:fish_redux/fish_redux.dart' as FishRedux;
import 'package:flutter_music/sections/login/page/login/page.dart';
import 'package:flutter_music/sections/login/page/photo_login/page.dart';
import 'package:flutter_music/sections/music/page/playlist_detail/page.dart';
import 'package:flutter_music/sections/music/page/recommend_list/page.dart';
import 'package:flutter_music/sections/music/page/song/page.dart';
import 'package:flutter_music/sections/square/page/edit/page.dart';
import 'package:flutter_music/sections/square/page/page.dart';

class RouterHelper {
  static Map<String, FishRedux.Page> routers = {
    RouterKeys.square: PlaylistSquarePage(),
    RouterKeys.square_edit: SquareEditPage(),
    RouterKeys.login: LoginPage(),
    RouterKeys.photo_login: PhotoLoginPage(),
    RouterKeys.every_day_recommend_song: RecommendListPage(),
    RouterKeys.song: AudioPlayerPage(),
    RouterKeys.playlist_detail: PlaylistDetailPage()
  };
}

class RouterKeys {
  static const login = "login";
  static const photo_login = "photo_login";
  static const every_day_recommend_song = "every_day_recommend_song";

  //入口类
  static const applicaiton = "application";

  //歌单广场
  static const square = "square";

  //跟单category编辑
  static const square_edit = "square_edit";

  //音乐播放界面
  static const song = "song";

  //歌单详情
  static const playlist_detail = "play_list_detail";
}
