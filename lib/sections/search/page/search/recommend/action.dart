import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';

enum SearchRecommendAction { action, onTapItem, didFetchData }

class SearchRecommendActionCreator {
  static Action onAction() {
    return const Action(SearchRecommendAction.action);
  }

  static Action onTapItemAction(SearchRecommendHotsItem item) {
    return Action(SearchRecommendAction.onTapItem, payload: item);
  }

  static Action didFetchDataAction(SearchRecommendWrap wrap) {
    return Action(SearchRecommendAction.didFetchData, payload: wrap);
  }
}
