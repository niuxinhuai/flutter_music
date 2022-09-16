import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class SimQueryState implements Cloneable<SimQueryState> {
  SearchResultItem? item;

  @override
  SimQueryState clone() {
    return SimQueryState()..item = item;
  }
}

SimQueryState initState(Map<String, dynamic> args) {
  return SimQueryState();
}
