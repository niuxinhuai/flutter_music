import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class PlaylistSquareState implements Cloneable<PlaylistSquareState> {
  String? title;
  LoadingState? loadingState;
  List<CatlistSubItem>? items;
  List<String>? normalList;

  @override
  PlaylistSquareState clone() {
    return PlaylistSquareState()
      ..title = title
      ..loadingState = loadingState
      ..items = items
      ..normalList = normalList;
  }
}

PlaylistSquareState initState(Map<String, dynamic>? args) {
  return PlaylistSquareState()
    ..title = "歌单广场"
    ..loadingState = LoadingState.isLoading
    ..normalList = ["推荐", "官方", "精品"];
}
