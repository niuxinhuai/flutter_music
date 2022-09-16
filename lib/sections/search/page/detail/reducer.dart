import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchDetailState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchDetailState>>{
      SearchDetailAction.action: _onAction,
    },
  );
}

SearchDetailState _onAction(SearchDetailState state, Action action) {
  final SearchDetailState newState = state.clone();
  return newState;
}
