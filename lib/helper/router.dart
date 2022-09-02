import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/utils/animation.dart';
import 'package:flutter_music/widgets/router.dart';

class ARouter {
  static Future<dynamic> open(BuildContext context, String url,
      {Map<String, dynamic>? params}) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return RouterHelper.routers[url]!.buildPage(params);
    })).then((value) => value);
  }

  static Future<dynamic> present(BuildContext context, String url,
      {Map<String, dynamic>? params}) {
    return Navigator.of(context)
        .push(
            SlideTransitionRoute(RouterHelper.routers[url]!.buildPage(params)))
        .then((value) => value);
  }

  static close(BuildContext context, {Map<String, dynamic>? result}) {
    return Navigator.pop(context, result);
  }

  static closeDelay(BuildContext context, Duration dutation) {
    return Future.delayed(dutation, () {
      return Navigator.pop(context);
    });
  }

  //** 跳转增加动画  */
  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext c, Animation<double> animation,
            Animation<double> sdAnimation) {
      return widget;
    }, transitionsBuilder: (BuildContext c, Animation<double> animation,
        Animation<double> sdAnimation, Widget child) {
      return AnimationUtil.transition(animation, child);
    }));
  }

  //**  返回pop */
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
