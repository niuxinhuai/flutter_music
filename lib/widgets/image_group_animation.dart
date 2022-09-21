import 'package:flutter/material.dart' hide Action;

class ImageGroupAnimation extends StatefulWidget {
  final double width;
  final double height;
  final List<String>? imageArray;
  final int durationSecond;
  final Color? imageColor;

  ImageGroupAnimation({
    this.width = 30.0,
    this.height = 30.0,
    this.imageArray,
    this.durationSecond = 600,
    this.imageColor,
  });

  @override
  _ImageGroupAnimationState createState() => _ImageGroupAnimationState();
}

class _ImageGroupAnimationState extends State<ImageGroupAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    images.clear();
    if (widget.imageArray != null && widget.imageArray!.isNotEmpty) {
      images.addAll(widget.imageArray!);
    } else {
      for (int i = 1; i < 5; ++i) {
        images.add('assets/images/cm2_list_icn_loading$i~iphone.png');
      }
    }
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.durationSecond))
      ..repeat();
    _animation =
        new IntTween(begin: 0, end: images.length - 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    if (images == null || images.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height,
        child: Text('must be have imageList'),
      );
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        int index = _animation.value;
        return Image.asset(
          images[index],
          gaplessPlayback: true, // 待测试，避免图片闪烁
          width: widget.width,
          height: widget.height,
          fit: BoxFit.fitWidth,
          color: widget.imageColor,
        );
      },
    );
  }

  @override
  void dispose() {
    images.clear();
    _controller.dispose();
    super.dispose();
  }
}
