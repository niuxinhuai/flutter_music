import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<VillageState>? buildEffect() {
  return combineEffects(<Object, Effect<VillageState>>{
    VillageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VillageState> ctx) {}
