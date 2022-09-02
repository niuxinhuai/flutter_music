import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/widget/disc_animation.dart';
import 'package:flutter_music/widgets/slider.dart';

class VideoMusicWidget extends StatefulWidget {
  final double? width;
  final String? coverUrl;
  final double? progressValue;

  VideoMusicWidget({this.width, this.coverUrl, this.progressValue = 0});

  @override
  _VideoMusicWidgetState createState() => _VideoMusicWidgetState();
}

class _VideoMusicWidgetState extends State<VideoMusicWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildMusic(), _buildSlider()],
      ),
    );
  }

  Widget _buildMusic() {
    return Container(
      width: widget.width,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/cm7_recommond~iphone.png",
                color: CommonColors.textColorDDD,
              ),
              Text(
                "scroll text action",
                style: GpOtherTheme.size13(context)!
                    .copyWith(color: CommonColors.textColorDDD),
              ),
              Image.asset(
                "assets/images/cm8_my_music_intelligent~iphone.png",
                color: CommonColors.textColorDDD,
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            child: MusicDiscAnimationWidget(
              imageUrl: widget.coverUrl,
              circleMargin: EdgeInsets.all(7.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return Container(
      height: 6,
      child: SliderWidget(
        trackHeight: 2,
        thumbRadius: 6,
        value: widget.progressValue,
      ),
    );
  }
}
