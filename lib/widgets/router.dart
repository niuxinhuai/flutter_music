import 'package:flutter/material.dart';

///底部弹出动画
class SlideTransitionRoute extends PageRouteBuilder {
  final Widget? widget;

  //构造方法
  SlideTransitionRoute(this.widget)
      : super(
            transitionDuration: Duration(milliseconds: 300), //过渡时间
            pageBuilder: (
              //构造器
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget!;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.easeInOut)),
                child: child,
              );
            });
}
