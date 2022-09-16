import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SimQueryAction { action }

class SimQueryActionCreator {
  static Action onAction() {
    return const Action(SimQueryAction.action);
  }
}
