import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchTopicState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchTopicState>>{
    SearchTopicAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SearchTopicState> ctx) {}
