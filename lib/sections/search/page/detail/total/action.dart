import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_multimatch.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

enum SearchResultTotalAction { action, didFetchData }

class SearchResultTotalActionCreator {
  static Action onAction() {
    return const Action(SearchResultTotalAction.action);
  }

  static Action didFetchDataAction(
      SearchResultWrap wrap, SearchMultimatchWrap multimatchWrap) {
    return Action(SearchResultTotalAction.didFetchData,
        payload: Tuple2(wrap, multimatchWrap));
  }
}
