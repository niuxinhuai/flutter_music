import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PlaylistState>? buildEffect() {
  return combineEffects(<Object, Effect<PlaylistState>>{
    PlaylistAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PlaylistState> ctx) {}
