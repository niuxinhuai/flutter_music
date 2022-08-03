import 'dart:ui';

import 'package:flutter/material.dart';

class EffectWidget extends StatelessWidget {
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final Widget? child;
  final EdgeInsets? padding;
  EffectWidget(
      {this.borderRadius,
      this.width,
      this.height,
      this.decoration,
      this.child,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(15.0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: width ?? double.infinity,
//          height: height ?? 200.0,
          padding: padding ?? EdgeInsets.only(left: 15, right: 15),
          decoration: decoration ??
              BoxDecoration(color: Colors.grey.shade200.withOpacity(0.2)),
          child: child ??
              Center(
                child: Text(
                  "天河区扛把子",
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
        ),
      ),
    );
  }
}
