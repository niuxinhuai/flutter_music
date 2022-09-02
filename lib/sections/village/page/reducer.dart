import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<VillageState>? buildReducer() {
  return asReducer(
    <Object, Reducer<VillageState>>{
      VillageAction.action: _onAction,
      VillageAction.didRefresh: _didRefresh,
      VillageAction.didError: _didError,
    },
  );
}

VillageState _didRefresh(VillageState state, Action action) {
  final VillageState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.categoryWrap = action.payload;
  return newState;
}

VillageState _didError(VillageState state, Action action) {
  final VillageState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

VillageState _onAction(VillageState state, Action action) {
  final VillageState newState = state.clone();
  return newState;
}
