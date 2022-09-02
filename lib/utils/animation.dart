import 'package:flutter/material.dart';

class AnimationUtil {
  static transition(Animation<double> animation, Widget widget) {
    return SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: widget,
    );
  }
}
