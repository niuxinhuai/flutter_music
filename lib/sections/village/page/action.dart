import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VillageAction { action }

class VillageActionCreator {
  static Action onAction() {
    return const Action(VillageAction.action);
  }
}
