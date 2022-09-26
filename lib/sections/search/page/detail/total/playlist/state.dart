import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class PlaylistState implements Cloneable<PlaylistState> {
  SearchResultItem? item;
  String? searchKey;

  @override
  PlaylistState clone() {
    return PlaylistState()
      ..item = item
      ..searchKey = searchKey;
  }
}

PlaylistState initState(Map<String, dynamic> args) {
  return PlaylistState();
}
