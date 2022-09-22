import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchTopicState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchTopicState>>{
      SearchTopicAction.action: _onAction,
    },
  );
}

SearchTopicState _onAction(SearchTopicState state, Action action) {
  final SearchTopicState newState = state.clone();
  return newState;
}
