import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VillageState>? buildReducer() {
  return asReducer(
    <Object, Reducer<VillageState>>{
      VillageAction.action: _onAction,
    },
  );
}

VillageState _onAction(VillageState state, Action action) {
  final VillageState newState = state.clone();
  return newState;
}
