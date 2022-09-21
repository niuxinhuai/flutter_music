import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/utils/audio_player_util.dart';
import 'package:flutter_music/utils/time_utl.dart';
import 'package:flutter_music/widgets/slider.dart';

class AudioControl extends StatefulWidget {
  String? url;
  AudioControl({this.url});

  @override
  _AudioControlState createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  @override
  void initState() {
    super.initState();

    if (widget.url != null) {
      AudioPlayerUtils.playerHandle(widget.url!);
      AudioPlayerUtils.onPlayerStateChanged.listen((event) {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    AudioPlayerUtils.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Column(
        children: [_buildSliderProgressWidget(), _buildBottom()],
      ),
    );
  }

  Widget _buildSliderProgressWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 20),
      child: Row(
        children: [
          Text(
            TimeUtils.getMinuteFromMillSecond(
                AudioPlayerUtils.position.inMilliseconds),
            style: GpOtherTheme.size12(context)!
                .copyWith(fontSize: 10, color: CommonColors.textColor999),
          ),
          Expanded(child: _buildSlider()),
          Text(
            TimeUtils.getMinuteFromMillSecond(
                AudioPlayerUtils.duration.inMilliseconds),
            style: GpOtherTheme.size12(context)!
                .copyWith(fontSize: 10, color: CommonColors.textColor999),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    double value = 0.0;
    if (AudioPlayerUtils.duration.inMilliseconds != 0 &&
        AudioPlayerUtils.position.inMilliseconds != 0.0) {
      value = AudioPlayerUtils.position.inMilliseconds *
          1.0 /
          AudioPlayerUtils.duration.inMilliseconds *
          1.0;
    }
    if (value > 1.0) {
      value = 1.0;
    }
    return Container(
      height: 4,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SliderWidget(
        bgColor: Colors.transparent,
        inactiveTrackColor: CommonColors.textColor999,
        activeTrackColor: CommonColors.textColorDDD,
        trackHeight: 1,
        thumbRadius: 4,
        value: value,
      ),
    );
  }

  Widget _buildBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/images/cm6_playlist_icn_loop~iphone.png",
          color: CommonColors.foregroundColor,
          width: 35,
          fit: BoxFit.fitWidth,
        ),
        Icon(
          Icons.skip_previous,
          color: CommonColors.foregroundColor,
          size: 30,
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: UnconstrainedBox(
            child: Image.asset(
              "assets/images/cm8_event_flow_song_pause~iphone.png",
              color: CommonColors.foregroundColor,
              width: 30,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Icon(
          Icons.skip_next,
          color: CommonColors.foregroundColor,
          size: 30,
        ),
        Image.asset(
          "assets/images/cm8_btn_tabbar_playlist~iphone.png",
          color: CommonColors.foregroundColor,
          width: 35,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
