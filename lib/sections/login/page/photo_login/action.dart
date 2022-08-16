import 'package:fish_redux/fish_redux.dart';

enum PhotoLoginAction {
  action,
  onTapClear,
  onTapLogin,
  onTapSendCaptcha,
  didRefresh
}

class PhotoLoginActionCreator {
  static Action onAction() {
    return const Action(PhotoLoginAction.action);
  }

  static Action onTapLoginAction() {
    return const Action(PhotoLoginAction.onTapLogin);
  }

  static Action onTapClearAction() {
    return const Action(PhotoLoginAction.onTapClear);
  }

  static Action onTapSendCaptchaAction() {
    return const Action(PhotoLoginAction.onTapSendCaptcha);
  }

  static Action didRefreshAction() {
    return const Action(PhotoLoginAction.didRefresh);
  }
}
