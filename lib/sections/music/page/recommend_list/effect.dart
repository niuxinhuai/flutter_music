import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'action.dart';
import 'state.dart';

Effect<RecommendListState>? buildEffect() {
  return combineEffects(<Object, Effect<RecommendListState>>{
    RecommendListAction.action: _onAction,
    RecommendListAction.onTapItem: _onTapItem,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<RecommendListState> ctx) async {
  RecommendListWrap wrap = await CommonService.getRecommendListMusic();
  if (wrap.data?.recommendReasons != null &&
      wrap.data?.recommendReasons?.isNotEmpty == true &&
      wrap.data?.dailySongs != null &&
      wrap.data?.dailySongs?.isNotEmpty == true) {
    for (RecommendReasonItem item in wrap.data!.recommendReasons!) {
      DailySongItem songItem = wrap.data!.dailySongs!.firstWhere(
          (element) => element.id == item.songId && element.id != null,
          orElse: () => DailySongItem());
      if (songItem.id != null) {}
      songItem.reason = item.reason;
    }
  }
  print(">>>>>>>>>>wrap:${wrap.data?.dailySongs?.length}");
  ctx.dispatch(RecommendListActionCreator.didFetchDataAction(wrap));
}

void _onTapItem(Action action, Context<RecommendListState> ctx) {
  final DailySongItem item = action.payload;
  ARouter.open(ctx.context, RouterKeys.song, params: {
    "id": item.id!.toString(),
    "name": item.name,
    "pic": item.al?.picUrl,
    "singer": item.getSongString()
  });
}

void _onAction(Action action, Context<RecommendListState> ctx) {}
