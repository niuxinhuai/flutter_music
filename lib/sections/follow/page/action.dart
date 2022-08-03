import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyFocusAction { action }

class MyFocusActionCreator {
  static Action onAction() {
    return const Action(MyFocusAction.action);
  }
}
