import 'package:fish_redux/fish_redux.dart';

enum LoginAction { action, onLeading, onTapLogin }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onLeadingAction() {
    return const Action(LoginAction.onLeading);
  }

  static Action onTapLoginAction() {
    return const Action(LoginAction.onTapLogin);
  }
}
