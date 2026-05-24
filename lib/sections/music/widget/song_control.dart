import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/utils/audio_player_util.dart';
import 'package:flutter_music/utils/time_utl.dart';
import 'package:flutter_music/widgets/slider.dart';

class AudioControl extends StatefulWidget {
  final String? url;
  final String? id;
  final String? name;
  final String? singer;
  final String? imageUrl;
  AudioControl({this.url, this.id, this.name, this.singer, this.imageUrl});

  @override
  _AudioControlState createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  StreamSubscription<Duration>? _positionSubscription;

  @override
  void initState() {
    super.initState();

    _playCurrentUrl();
    _positionSubscription = AudioPlayerUtils.onPlayerStateChanged.listen((
      event,
    ) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant AudioControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.url != null && widget.url != oldWidget.url) {
      _playCurrentUrl();
    }
  }

  void _playCurrentUrl() {
    if (widget.url == null) {
      return;
    }
    AudioPlayerUtils.playerHandle(
      widget.url!,
      id: widget.id,
      title: widget.name,
      artist: widget.singer,
      artworkUrl: widget.imageUrl,
    );
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    AudioPlayerUtils.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Column(children: [_buildSliderProgressWidget(), _buildBottom()]),
    );
  }

  Widget _buildSliderProgressWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 20),
      child: Row(
        children: [
          Text(
            TimeUtils.getMinuteFromMillSecond(
              AudioPlayerUtils.position.inMilliseconds,
            ),
            style: GpOtherTheme.size12(
              context,
            )!.copyWith(fontSize: 10, color: CommonColors.textColor999),
          ),
          Expanded(child: _buildSlider()),
          Text(
            TimeUtils.getMinuteFromMillSecond(
              AudioPlayerUtils.duration.inMilliseconds,
            ),
            style: GpOtherTheme.size12(
              context,
            )!.copyWith(fontSize: 10, color: CommonColors.textColor999),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    double value = 0.0;
    if (AudioPlayerUtils.duration.inMilliseconds != 0 &&
        AudioPlayerUtils.position.inMilliseconds != 0.0) {
      value =
          AudioPlayerUtils.position.inMilliseconds *
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
        GestureDetector(
          onTap: () => AudioPlayerUtils.previous(),
          child: Icon(
            Icons.skip_previous,
            color: CommonColors.foregroundColor,
            size: 30,
          ),
        ),
        GestureDetector(
          onTap: () => AudioPlayerUtils.toggle(),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: UnconstrainedBox(
              child: Image.asset(
                AudioPlayerUtils.state == AudioPlayerState.playing
                    ? "assets/images/cm8_event_flow_song_pause~iphone.png"
                    : "assets/images/cm8_event_flow_song_play~iphone.png",
                color: CommonColors.foregroundColor,
                width: 30,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => AudioPlayerUtils.next(),
          child: Icon(
            Icons.skip_next,
            color: CommonColors.foregroundColor,
            size: 30,
          ),
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
