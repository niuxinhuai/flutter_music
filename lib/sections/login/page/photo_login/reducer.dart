import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PhotoLoginState>? buildReducer() {
  return asReducer(
    <Object, Reducer<PhotoLoginState>>{
      PhotoLoginAction.action: _onAction,
      PhotoLoginAction.didRefresh: _didRefresh,
    },
  );
}

PhotoLoginState _didRefresh(PhotoLoginState state, Action action) {
  final PhotoLoginState newState = state.clone();
  return newState;
}

PhotoLoginState _onAction(PhotoLoginState state, Action action) {
  final PhotoLoginState newState = state.clone();
  return newState;
}
