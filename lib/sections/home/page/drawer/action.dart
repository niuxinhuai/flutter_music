import 'package:fish_redux/fish_redux.dart';

enum HomeDrawerAction { action, onTapSegment, onTapLogin, onTapQRCode }

class HomeDrawerActionCreator {
  static Action onAction() {
    return const Action(HomeDrawerAction.action);
  }

  static Action onTapSegmentAction(String value) {
    return Action(HomeDrawerAction.onTapSegment, payload: value);
  }

  static Action onTapLoginAction() {
    return const Action(HomeDrawerAction.onTapLogin);
  }

  static Action onTapQRCodeAction() {
    return const Action(HomeDrawerAction.onTapQRCode);
  }
}
