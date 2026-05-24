import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/sections/music/models/song.dart';

enum AudioPlayerAction {
  action,
  didTapShowLyric,
  onTapDownload,
  didFetchData,
  didUpdatePlaybackUrl,
}

class AudioPlayerActionCreator {
  static Action onAction() {
    return const Action(AudioPlayerAction.action);
  }

  static Action didTapShowLyricAction() {
    return const Action(AudioPlayerAction.didTapShowLyric);
  }

  static Action onTapDownloadAction() {
    return const Action(AudioPlayerAction.onTapDownload);
  }

  static Action didFetchDataAction(
    SongWrap songWrap,
    SongLyric songLyric,
    String? resolvedUrl,
  ) {
    return Action(
      AudioPlayerAction.didFetchData,
      payload: Tuple3(songWrap, songLyric, resolvedUrl),
    );
  }

  static Action didUpdatePlaybackUrlAction(String url) {
    return Action(AudioPlayerAction.didUpdatePlaybackUrl, payload: url);
  }
}
