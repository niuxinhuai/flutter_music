import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/sections/music/models/song.dart';

enum AudioPlayerAction { action, didTapShowLyric, didFetchData }

class AudioPlayerActionCreator {
  static Action onAction() {
    return const Action(AudioPlayerAction.action);
  }

  static Action didTapShowLyricAction() {
    return const Action(AudioPlayerAction.didTapShowLyric);
  }

  static Action didFetchDataAction(SongWrap songWrap, SongLyric songLyric) {
    return Action(AudioPlayerAction.didFetchData,
        payload: Tuple2(songWrap, songLyric));
  }
}
