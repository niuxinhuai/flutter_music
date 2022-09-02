import 'package:flutter/material.dart';

class MusicDiscAnimationWidget extends StatefulWidget {
  final double? width;
  final String? imageUrl;
  final EdgeInsetsGeometry? circleMargin;

  MusicDiscAnimationWidget({this.width, this.imageUrl, this.circleMargin});

  @override
  _MusicDiscAnimationWidgetState createState() =>
      _MusicDiscAnimationWidgetState();
}

class _MusicDiscAnimationWidgetState extends State<MusicDiscAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));

    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
//        print("status is completed");
        //重置起点
        controller!.reset();
        //开启
        controller!.forward();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
//        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
//        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
//        print("status is reverse");
      }
    });

    ///只有歌曲播放时，旋转动画才执行
    controller!.forward();
  }

  @override
  void dispose() {
    controller?.stop();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: new ExactAssetImage(
            'assets/images/cm2_default_cover_program~iphone.png'),
        fit: BoxFit.fitWidth,
      )),
      child: RotationTransition(
        alignment: Alignment.center,
        turns: controller!,
        child: Container(
          margin: widget.circleMargin ?? EdgeInsets.all(50),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(110)),
            child: Image.network(
              widget.imageUrl ?? "",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
