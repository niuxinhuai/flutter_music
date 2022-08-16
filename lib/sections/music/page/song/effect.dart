import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'action.dart';
import 'state.dart';

Effect<AudioPlayerState>? buildEffect() {
  return combineEffects(<Object, Effect<AudioPlayerState>>{
    AudioPlayerAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<AudioPlayerState> ctx) {
//  CommonService.getSongUrl(ctx.state.id!);
}

void _onAction(Action action, Context<AudioPlayerState> ctx) {}
