import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SingerState>? buildEffect() {
  return combineEffects(<Object, Effect<SingerState>>{
    SingerAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SingerState> ctx) {}
