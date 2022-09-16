import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchRecommendState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchRecommendState>>{
      SearchRecommendAction.action: _onAction,
    },
  );
}

SearchRecommendState _onAction(SearchRecommendState state, Action action) {
  final SearchRecommendState newState = state.clone();
  return newState;
}
