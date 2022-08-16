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
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.6),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.white.withOpacity(0),
          ),
        )
      ],
    );
  }
}
