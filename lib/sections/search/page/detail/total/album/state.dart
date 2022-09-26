import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class AlbumState implements Cloneable<AlbumState> {
  SearchResultItem? item;
  String? searchKey;

  @override
  AlbumState clone() {
    return AlbumState()
      ..item = item
      ..searchKey = searchKey;
  }
}

AlbumState initState(Map<String, dynamic> args) {
  return AlbumState();
}
