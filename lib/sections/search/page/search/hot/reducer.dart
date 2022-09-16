import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchHotState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchHotState>>{
      SearchHotAction.action: _onAction,
    },
  );
}

SearchHotState _onAction(SearchHotState state, Action action) {
  final SearchHotState newState = state.clone();
  return newState;
}
