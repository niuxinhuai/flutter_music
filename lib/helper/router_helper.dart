import 'package:fish_redux/fish_redux.dart' as FishRedux;
import 'package:flutter_music/sections/square/page/edit/page.dart';
import 'package:flutter_music/sections/square/page/page.dart';

class RouterHelper {
  static Map<String, FishRedux.Page> routers = {
    RouterKeys.square: PlaylistSquarePage(),
    RouterKeys.square_edit: SquareEditPage(),
  };
}

class RouterKeys {
  static const login = "login";
  static const register = "register";
  static const article = "article";

  //入口类
  static const applicaiton = "application";

  //歌单广场
  static const square = "square";

  //跟单category编辑
  static const square_edit = "square_edit";
}
