import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserState>? buildReducer() {
  return asReducer(
    <Object, Reducer<UserState>>{
      UserAction.action: _onAction,
    },
  );
}

UserState _onAction(UserState state, Action action) {
  final UserState newState = state.clone();
  return newState;
}
