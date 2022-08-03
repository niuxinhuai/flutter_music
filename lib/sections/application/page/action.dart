import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;

enum ApplicationAction {
  action,
  onPageChanged,
  onTap,
  didTap,
  didPageChanged,
  didFetch
}

class ApplicationActionCreator {
  static Action onAction() {
    return const Action(ApplicationAction.action);
  }

  static Action onPageChangedAction(int index) {
    return Action(ApplicationAction.onPageChanged, payload: index);
  }

  static Action onTapAction(int index) {
    return Action(ApplicationAction.onTap, payload: index);
  }

  static Action didPageChangedAction(int index) {
    return Action(ApplicationAction.didPageChanged, payload: index);
  }

  static Action didTapAction(int index) {
    return Action(ApplicationAction.didTap, payload: index);
  }

  static Action didFetchAction(int initialPage, P.PageController p) {
    return Action(ApplicationAction.didFetch, payload: Tuple2(initialPage, p));
  }
}
