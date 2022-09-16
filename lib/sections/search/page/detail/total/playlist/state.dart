import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class PlaylistState implements Cloneable<PlaylistState> {
  SearchResultItem? item;

  @override
  PlaylistState clone() {
    return PlaylistState()..item = item;
  }
}

PlaylistState initState(Map<String, dynamic> args) {
  return PlaylistState();
}
