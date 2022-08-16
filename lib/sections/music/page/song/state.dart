import 'package:fish_redux/fish_redux.dart';

class AudioPlayerState implements Cloneable<AudioPlayerState> {
  String? id;
  String? imageUrl;
  String? singer;
  String? name;

  @override
  AudioPlayerState clone() {
    return AudioPlayerState();
  }
}

AudioPlayerState initState(Map<String, dynamic>? args) {
  return AudioPlayerState()
    ..id = args!["id"]
    ..imageUrl = args["pic"]
    ..singer = args["singer"]
    ..name = args["name"];
}
