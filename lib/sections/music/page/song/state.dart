import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/sections/music/models/song.dart';

class AudioPlayerState implements Cloneable<AudioPlayerState> {
  String? id;
  String? imageUrl;
  String? singer;
  String? name;
  SongWrap? songWrap;
  SongLyric? songLyric;
  String? url;
  bool? showLyric;

  @override
  AudioPlayerState clone() {
    return AudioPlayerState()
      ..id = id
      ..imageUrl = imageUrl
      ..singer = singer
      ..name = name
      ..songWrap = songWrap
      ..songLyric = songLyric
      ..url = url
      ..showLyric = showLyric;
  }
}

AudioPlayerState initState(Map<String, dynamic>? args) {
  return AudioPlayerState()
    ..id = args!["id"]
    ..imageUrl = args["pic"]
    ..singer = args["singer"]
    ..name = args["name"]
    ..showLyric = false;
}
