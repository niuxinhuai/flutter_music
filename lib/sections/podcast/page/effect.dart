import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PodcastState>? buildEffect() {
  return combineEffects(<Object, Effect<PodcastState>>{
    PodcastAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PodcastState> ctx) {}
