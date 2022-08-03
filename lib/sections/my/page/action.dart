import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserCenterAction { action }

class UserCenterActionCreator {
  static Action onAction() {
    return const Action(UserCenterAction.action);
  }
}
