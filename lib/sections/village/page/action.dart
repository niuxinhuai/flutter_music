import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/village/models/category.dart';

enum VillageAction {
  action,
  onTapLeading,
  onTapError,
  onTapNav,
  didRefresh,
  didError
}

class VillageActionCreator {
  static Action onAction() {
    return const Action(VillageAction.action);
  }

  static Action onTapNavAction() {
    return const Action(VillageAction.onTapNav);
  }

  static Action onTapLeadingAction() {
    return const Action(VillageAction.onTapLeading);
  }

  static Action onTapErrorAction() {
    return const Action(VillageAction.onTapError);
  }

  static Action didErrorAction() {
    return const Action(VillageAction.didError);
  }

  static Action didRefreshAction(VideoCategoryWrap categoryWrap) {
    return Action(VillageAction.didRefresh, payload: categoryWrap);
  }
}
