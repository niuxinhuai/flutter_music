import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class ArtistState implements Cloneable<ArtistState> {
  SearchResultItem? item;

  @override
  ArtistState clone() {
    return ArtistState()..item = item;
  }
}

ArtistState initState(Map<String, dynamic> args) {
  return ArtistState();
}
