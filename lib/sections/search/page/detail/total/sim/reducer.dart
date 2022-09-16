import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SimQueryState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SimQueryState>>{
      SimQueryAction.action: _onAction,
    },
  );
}

SimQueryState _onAction(SimQueryState state, Action action) {
  final SimQueryState newState = state.clone();
  return newState;
}
