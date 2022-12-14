import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class UserState implements Cloneable<UserState> {
  SearchResultItem? item;
  String? searchKey;

  @override
  UserState clone() {
    return UserState()
      ..item = item
      ..searchKey = searchKey;
  }
}

UserState initState(Map<String, dynamic> args) {
  return UserState();
}
