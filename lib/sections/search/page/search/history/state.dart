import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SearchHistoryState implements Cloneable<SearchHistoryState> {
  List<UserSearchLog> logs = [];

  @override
  SearchHistoryState clone() {
    return SearchHistoryState()..logs = logs;
  }
}

SearchHistoryState initState(Map<String, dynamic> args) {
  return SearchHistoryState();
}
