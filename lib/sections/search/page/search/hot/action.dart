import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';

enum SearchHotAction { action, didFetchData }

class SearchHotActionCreator {
  static Action onAction() {
    return const Action(SearchHotAction.action);
  }

  static Action didFetchDataAction(SearchHotWrap wrap) {
    return Action(SearchHotAction.didFetchData, payload: wrap);
  }
}
