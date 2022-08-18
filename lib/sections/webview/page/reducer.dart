import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CustomWebViewState>? buildReducer() {
  return asReducer(
    <Object, Reducer<CustomWebViewState>>{
      CustomWebViewAction.action: _onAction,
      CustomWebViewAction.didProgress: _didProgress,
      CustomWebViewAction.didPageFinished: _didPageFinished,
    },
  );
}

CustomWebViewState _didProgress(CustomWebViewState state, Action action) {
  final int progress = action.payload;
  final CustomWebViewState newState = state.clone();
  newState.progress = progress;
  return newState;
}

CustomWebViewState _didPageFinished(CustomWebViewState state, Action action) {
  final CustomWebViewState newState = state.clone();
  newState.showProgress = false;
  return newState;
}

CustomWebViewState _onAction(CustomWebViewState state, Action action) {
  final CustomWebViewState newState = state.clone();
  return newState;
}
