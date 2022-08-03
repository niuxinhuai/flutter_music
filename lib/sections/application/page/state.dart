import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/sections/follow/page/page.dart';
import 'package:flutter_music/sections/home/page/page.dart';
import 'package:flutter_music/sections/my/page/page.dart';
import 'package:flutter_music/sections/podcast/page/page.dart';
import 'package:flutter_music/sections/village/page/page.dart';
import 'package:flutter_music/widgets/segment.dart';

class ApplicationState implements Cloneable<ApplicationState> {
  int? page;
  P.PageController? pageController;
  List<P.Widget> children = [];

  @override
  ApplicationState clone() {
    return ApplicationState()
      ..page = page
      ..pageController = pageController
      ..children = children;
  }
}

ApplicationState initState(Map<String, dynamic>? args) {
  List<P.Widget> children = [];
  children.add(KeepAliveWidget(
    childWidget: HomeMusicPage().buildPage({}),
  ));
  children.add(KeepAliveWidget(
    childWidget: PodcastPage().buildPage({}),
  ));
  children.add(KeepAliveWidget(
    childWidget: UserCenterPage().buildPage({}),
  ));
  children.add(KeepAliveWidget(
    childWidget: MyFocusPage().buildPage({}),
  ));
  children.add(KeepAliveWidget(
    childWidget: VillagePage().buildPage({}),
  ));

  return ApplicationState()..children = children;
}
