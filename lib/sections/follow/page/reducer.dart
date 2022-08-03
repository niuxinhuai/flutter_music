import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyFocusState>? buildReducer() {
  return asReducer(
    <Object, Reducer<MyFocusState>>{
      MyFocusAction.action: _onAction,
    },
  );
}

MyFocusState _onAction(MyFocusState state, Action action) {
  final MyFocusState newState = state.clone();
  return newState;
}
