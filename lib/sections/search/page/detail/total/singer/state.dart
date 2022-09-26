import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class SingerState implements Cloneable<SingerState> {
  SearchResultItem? item;
  String? searchkey;

  @override
  SingerState clone() {
    return SingerState()
      ..item = item
      ..searchkey = searchkey;
  }
}

SingerState initState(Map<String, dynamic> args) {
  return SingerState();
}
