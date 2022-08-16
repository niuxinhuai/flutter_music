import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/paint/water.dart';

class WaterRipple extends StatefulWidget {
  final int count;
  final Color color;
  final PaintingStyle? paintingStyle;

  WaterRipple(
      {this.count = 3,
      this.color = const Color(0xFF0080ff),
      this.paintingStyle});

  @override
  _WaterRippleState createState() => _WaterRippleState();
}

class _WaterRippleState extends State<WaterRipple>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return CustomPaint(
          painter: WaterRipplePainter(_controller!.value,
              count: widget.count,
              color: widget.color,
              paintingStyle: widget.paintingStyle),
        );
      },
    );
  }
}
