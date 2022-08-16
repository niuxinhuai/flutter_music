import 'dart:math';

import 'package:flutter/material.dart';

class WaterRipplePainter extends CustomPainter {
  final double progress;
  final int count;
  final Color color;
  final PaintingStyle? paintingStyle;

  WaterRipplePainter(this.progress,
      {this.count = 3,
      this.color = const Color(0xFF0080ff),
      this.paintingStyle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..style = PaintingStyle.fill;
    double radius = min(size.width / 2, size.height / 2);

    print(">>>>>>>>>>>size:$size");
    for (int i = count; i >= 0; i--) {
      double value = ((i + progress) / (count + 1));
      double sec = progress * 5 + radius - 20;
      final double opacity = (1.0 - value);

      final Color _color = color.withOpacity(opacity);
      _paint..color = _color;

      double _radius = radius * value;
      print(
          ">>>>>>value:$value  >>>>sec:$sec  >>>>>progress:$progress >>>>radiu:$_radius");
      if (_radius < 15) {
        _radius = 15;
      }

      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), _radius, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
