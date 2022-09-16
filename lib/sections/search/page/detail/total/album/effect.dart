import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AlbumState>? buildEffect() {
  return combineEffects(<Object, Effect<AlbumState>>{
    AlbumAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AlbumState> ctx) {}
