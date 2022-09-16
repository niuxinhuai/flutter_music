import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ArtistState>? buildEffect() {
  return combineEffects(<Object, Effect<ArtistState>>{
    ArtistAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ArtistState> ctx) {}
