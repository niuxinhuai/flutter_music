import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';

class SliderWidget extends StatefulWidget {
  final Color? bgColor;
  final Color? inactiveTrackColor;
  final Color? activeTrackColor;
  final double? trackHeight;
  final double? thumbRadius;
  final double? value;

  SliderWidget(
      {this.bgColor = Colors.black,
      this.inactiveTrackColor = Colors.white10,
      this.activeTrackColor = const Color(0xFFDDDDDD),
      this.trackHeight = 2,
      this.thumbRadius = 6,
      this.value = 0});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
//    print(">>>>>>>>>>>value:${widget.value}");
    return Material(
      color: widget.bgColor,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: widget.trackHeight, // 轨道高度
          trackShape: FullWidthTrackShape(), // 轨道形状，可以自定义
          activeTrackColor: widget.activeTrackColor, // 激活的轨道颜色
          inactiveTrackColor: widget.inactiveTrackColor, // 未激活的轨道颜色
          thumbShape: RoundSliderThumbShape(
              //  滑块形状，可以自定义
              enabledThumbRadius: widget.thumbRadius! // 滑块大小
              ),
          thumbColor: Colors.white, // 滑块颜色
          overlayShape: RoundSliderOverlayShape(
            // 滑块外圈形状，可以自定义
            overlayRadius: widget.thumbRadius!, // 滑块外圈大小
          ),
          overlayColor: Colors.cyan, // 滑块外圈颜色
          valueIndicatorShape: PaddleSliderValueIndicatorShape(), // 标签形状，可以自定义
          activeTickMarkColor: Colors.red, // 激活的刻度颜色
        ),
        child: Slider(
          value: widget.value!,
          onChanged: (double value) {},
        ),
      ),
    );
  }
}

class FullWidthTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox? parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData? sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme!.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox!.size.height - trackHeight) / 2;
    // 让轨道宽度等于 Slider 宽度
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
