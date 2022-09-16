import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserAction { action }

class UserActionCreator {
  static Action onAction() {
    return const Action(UserAction.action);
  }
}
