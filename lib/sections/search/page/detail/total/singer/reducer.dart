import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SingerState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SingerState>>{
      SingerAction.action: _onAction,
    },
  );
}

SingerState _onAction(SingerState state, Action action) {
  final SingerState newState = state.clone();
  return newState;
}
