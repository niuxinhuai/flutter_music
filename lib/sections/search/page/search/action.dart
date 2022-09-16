import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';

enum SearchAction { action, onTapSearch, didFetchData }

class SearchActionCreator {
  static Action onAction() {
    return const Action(SearchAction.action);
  }

  static Action onTapSearchAction(String? text) {
    return Action(SearchAction.onTapSearch, payload: text);
  }

  static Action didFetchDataAction(SearchHotWrap hotWrap,
      SearchRecommendWrap recommendWrap, List<UserSearchLog> logs) {
    return Action(SearchAction.didFetchData,
        payload: Tuple3(hotWrap, recommendWrap, logs));
  }
}
