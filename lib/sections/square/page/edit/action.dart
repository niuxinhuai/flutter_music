import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';

enum SquareEditAction {
  action,
  onTapItem,
  didTapItem,
  didTapEditButton,
  didFetchData,
  didReorder
}

class SquareEditActionCreator {
  static Action onAction() {
    return const Action(SquareEditAction.action);
  }

  static Action onTapItemAction(
      CatlistSubItem subItem, CatlistSectionModel sectionModel) {
    return Action(SquareEditAction.onTapItem,
        payload: Tuple2(subItem, sectionModel));
  }

  static Action didReorderAction(Tuple2<int, int> data) {
    return Action(SquareEditAction.didReorder, payload: data);
  }

  static Action didTapItemAction() {
    return const Action(SquareEditAction.didTapItem);
  }

  static Action didTapEditButtonAction() {
    return const Action(SquareEditAction.didTapEditButton);
  }

  static Action didFetchDataAction(List<CatlistSectionModel> models) {
    return Action(SquareEditAction.didFetchData, payload: models);
  }
}
