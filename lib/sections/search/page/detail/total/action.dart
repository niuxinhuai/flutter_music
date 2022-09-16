import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

enum SearchResultTotalAction { action, didFetchData }

class SearchResultTotalActionCreator {
  static Action onAction() {
    return const Action(SearchResultTotalAction.action);
  }

  static Action didFetchDataAction(SearchResultWrap wrap) {
    return Action(SearchResultTotalAction.didFetchData, payload: wrap);
  }
}
