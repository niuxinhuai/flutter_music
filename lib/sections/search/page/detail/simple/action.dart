import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

enum SearchSimpleAction { action, didFetchData }

class SearchSimpleActionCreator {
  static Action onAction() {
    return const Action(SearchSimpleAction.action);
  }

  static Action didFetchDataAction(SearchResultWrap wrap) {
    return Action(SearchSimpleAction.didFetchData, payload: wrap);
  }
}
