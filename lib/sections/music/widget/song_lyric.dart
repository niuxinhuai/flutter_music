import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/utils/audio_player_util.dart';
import 'package:flutter_music/utils/time_utl.dart';

class AudioLyricWidget extends StatefulWidget {
  final SongLyric? songLyric;
  AudioLyricWidget({this.songLyric});

  @override
  _AudioLyricWidgetState createState() => _AudioLyricWidgetState();
}

class _AudioLyricWidgetState extends State<AudioLyricWidget> {
  List<AudioLyricModel> models = [];

  double itemHeight = 60.0;
  ScrollController scrollController = ScrollController();
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();

    if (widget.songLyric?.lrc?.lyric != null &&
        widget.songLyric?.lrc?.lyric?.isNotEmpty == true) {
      String lyric = widget.songLyric!.lrc!.lyric!;
      String p = "\n";
      if (lyric.contains(p)) {
        models = lyric.split(p).map((e) {
          AudioLyricModel mode = AudioLyricModel();
          String rightPe = "]";
          String leftPe = "[";
          if (e.contains(rightPe)) {
            List<String> clipNext = e.split(rightPe);
            String first = clipNext.first.replaceAll(leftPe, "");
            int mill = TimeUtils.getMillSecondFromMinute(first);
            mode.lyric = clipNext.last;
            mode.start = mill;
          }
          return mode;
        }).toList();

        for (int i = 0; i < models.length; ++i) {
          AudioLyricModel m = models[i];
          if (i < models.length - 1) {
            int index = i + 1;
            m.end = models[index].start;
          } else {
            m.end = 9999999999;
          }
        }
      }
      AudioPlayerUtils.onPlayerStateChanged.listen((event) {
        AudioLyricModel lyricModel = AudioLyricModel();

        int index = 0;
        for (int i = 0; i < models.length; ++i) {
          lyricModel = models[i];
          if (event.inMilliseconds >= lyricModel.start &&
              event.inMilliseconds < lyricModel.end!) {
            index = i;
            break;
          }
        }

        if (lyricModel.lyric != null && selectedIndex != index) {
          if (mounted) {
            setState(() {
              selectedIndex = index;

              models.forEach((element) {
                element.selected = false;
              });
              lyricModel.selected = true;
              scrollController.jumpTo(index * itemHeight);
//              scrollController.animateTo(index * itemHeight,
//                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
        itemExtent: itemHeight,
        controller: scrollController,
        diameterRatio: 5,
        childDelegate: ListWheelChildBuilderDelegate(
            builder: (BuildContext context, int index) {
              AudioLyricModel m = models[index];
              return Container(
                alignment: Alignment.center,
//                color: CommonColors.randomColor,
                child: Text(
                  m.lyric ?? "",
                  style: GpOtherTheme.size15(context)!.copyWith(
                      color: m.selected
                          ? CommonColors.onPrimaryTextColor
                          : CommonColors.textColor999,
                      fontSize: 17),
                ),
              );
            },
            childCount: models.length));
  }

  @override
  void dispose() {
//    AudioPlayerUtils.dispose();
    super.dispose();
  }
}
