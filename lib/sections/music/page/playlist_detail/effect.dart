import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/music/page/recommend_list/action.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'action.dart';
import 'state.dart';

Effect<PlaylistDetailState>? buildEffect() {
  return combineEffects(<Object, Effect<PlaylistDetailState>>{
    PlaylistDetailAction.action: _onAction,
    Lifecycle.initState: _initState,
    RecommendListAction.onTapItem: _onTapItem,
  });
}

void _initState(Action action, Context<PlaylistDetailState> ctx) async {
  PlaylistSquareWrap squareWrap =
      await CommonService.getPlaylistDetil(ctx.state.id!).catchError((e) {
    ctx.dispatch(PlaylistDetailActionCreator.didErrorAction());
  });
  if (squareWrap.code != null && squareWrap.code == 200) {
    ctx.dispatch(PlaylistDetailActionCreator.didFetchDataAction(squareWrap));
  } else {
    ctx.dispatch(PlaylistDetailActionCreator.didErrorAction());
  }
}

void _onTapItem(Action action, Context<PlaylistDetailState> ctx) {
  final DailySongItem item = action.payload;
  ARouter.open(ctx.context, RouterKeys.song, params: {
    "id": item.id!.toString(),
    "name": item.name,
    "pic": item.al?.picUrl,
    "singer": item.getSongString()
  });
}

void _onAction(Action action, Context<PlaylistDetailState> ctx) {}
