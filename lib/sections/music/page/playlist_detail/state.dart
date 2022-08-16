import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class PlaylistDetailState implements Cloneable<PlaylistDetailState> {
  String? id;
  PlaylistSquareWrap? squareWrap;
  LoadingState? loadingState;
  String? coverImgUrl;

  @override
  PlaylistDetailState clone() {
    return PlaylistDetailState()
      ..id = id
      ..squareWrap = squareWrap
      ..loadingState = loadingState
      ..coverImgUrl = coverImgUrl;
  }
}

PlaylistDetailState initState(Map<String, dynamic>? args) {
  String id = "4887974807";
  String coverImgUrl = "";
  if (args != null && args.keys.contains("id")) {
    id = args["id"];
  }

  if (args != null && args.keys.contains("coverImgUrl")) {
    coverImgUrl = args["coverImgUrl"];
  }

  return PlaylistDetailState()
    ..loadingState = LoadingState.isLoading
    ..id = id
    ..coverImgUrl = coverImgUrl;
}
