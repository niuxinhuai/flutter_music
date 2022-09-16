import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SingerAction { action }

class SingerActionCreator {
  static Action onAction() {
    return const Action(SingerAction.action);
  }
}
