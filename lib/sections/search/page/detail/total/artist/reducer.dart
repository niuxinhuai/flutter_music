import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ArtistState>? buildReducer() {
  return asReducer(
    <Object, Reducer<ArtistState>>{
      ArtistAction.action: _onAction,
    },
  );
}

ArtistState _onAction(ArtistState state, Action action) {
  final ArtistState newState = state.clone();
  return newState;
}
