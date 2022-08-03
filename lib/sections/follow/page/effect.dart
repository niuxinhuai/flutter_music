import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MyFocusState>? buildEffect() {
  return combineEffects(<Object, Effect<MyFocusState>>{
    MyFocusAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MyFocusState> ctx) {}
