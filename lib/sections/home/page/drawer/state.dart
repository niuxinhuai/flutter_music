import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawerState implements Cloneable<HomeDrawerState> {
  bool isLogin = true;
  List<String> titles = [];
  List<IconData> icons = [];

  @override
  HomeDrawerState clone() {
    return HomeDrawerState()
      ..isLogin = isLogin
      ..titles = titles
      ..icons = icons;
  }
}

HomeDrawerState initState(Map<String, dynamic>? args) {
  List<String> titles = ["我的收藏", "天气", "地图", "日历", "人脸识别", "设置", "关于", "登录"];
  List<IconData> icons = [
    Icons.favorite,
    Icons.cloud,
    Icons.map,
    Icons.calendar_today,
    Icons.face,
    Icons.settings,
    Icons.watch_later,
    Icons.logout
  ];

  return HomeDrawerState()
    ..titles = titles
    ..icons = icons;
}
