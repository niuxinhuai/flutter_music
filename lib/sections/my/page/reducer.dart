import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserCenterState>? buildReducer() {
  return asReducer(
    <Object, Reducer<UserCenterState>>{
      UserCenterAction.action: _onAction,
    },
  );
}

UserCenterState _onAction(UserCenterState state, Action action) {
  final UserCenterState newState = state.clone();
  return newState;
}
