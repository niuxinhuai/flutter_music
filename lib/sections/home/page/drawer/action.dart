import 'package:fish_redux/fish_redux.dart';

enum HomeDrawerAction { action, onTapSegment }

class HomeDrawerActionCreator {
  static Action onAction() {
    return const Action(HomeDrawerAction.action);
  }

  static Action onTapSegmentAction(String value) {
    return Action(HomeDrawerAction.onTapSegment, payload: value);
  }
}
