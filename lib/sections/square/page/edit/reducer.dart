import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SquareEditState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SquareEditState>>{
      SquareEditAction.action: _onAction,
      SquareEditAction.didFetchData: _didFetchData,
      SquareEditAction.didTapEditButton: _didTapEditButton,
      SquareEditAction.didTapItem: _didTapItem,
      SquareEditAction.didReorder: _didReorder,
    },
  );
}

SquareEditState _didFetchData(SquareEditState state, Action action) {
  final List<CatlistSectionModel> models = action.payload;
  final SquareEditState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.sections = models;
  return newState;
}

SquareEditState _didTapEditButton(SquareEditState state, Action action) {
  final SquareEditState newState = state.clone();
  newState.editing = !newState.editing!;
  newState.sections!.first.sub =
      newState.editing! == true ? "(拖动可排序)" : "(长按可编辑)";
  return newState;
}

SquareEditState _didTapItem(SquareEditState state, Action action) {
  final SquareEditState newState = state.clone();
  return newState;
}

SquareEditState _didReorder(SquareEditState state, Action action) {
  Tuple2<int, int> payload = action.payload;
  int? oldIndex = payload.i0;
  int? newIndex = payload.i1;
  final SquareEditState newState = state.clone();
  if (newState.sections!.first.items![oldIndex!].canMove! &&
      newState.sections!.first.items![newIndex!].canMove!) {
    CatlistSubItem item = newState.sections!.first.items!.removeAt(oldIndex);
    newState.sections!.first.items!.insert(newIndex, item);
  }
  return newState;
}

SquareEditState _onAction(SquareEditState state, Action action) {
  final SquareEditState newState = state.clone();
  return newState;
}
