import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SimQueryState>? buildEffect() {
  return combineEffects(<Object, Effect<SimQueryState>>{
    SimQueryAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SimQueryState> ctx) {}
