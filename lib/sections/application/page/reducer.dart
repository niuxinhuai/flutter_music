import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ApplicationState>? buildReducer() {
  return asReducer(
    <Object, Reducer<ApplicationState>>{
      ApplicationAction.action: _onAction,
      ApplicationAction.didFetch: _didFetch,
      ApplicationAction.didPageChanged: _didPageChanged,
    },
  );
}

ApplicationState _didFetch(ApplicationState state, Action action) {
  Tuple2 tuple2 = action.payload;

  final ApplicationState newState = state.clone();
  newState.page = tuple2.i0;
  newState.pageController = tuple2.i1;
  return newState;
}

ApplicationState _didPageChanged(ApplicationState state, Action action) {
  int index = action.payload;
  final ApplicationState newState = state.clone();
  newState.page = index;
  return newState;
}

ApplicationState _onAction(ApplicationState state, Action action) {
  final ApplicationState newState = state.clone();
  return newState;
}
