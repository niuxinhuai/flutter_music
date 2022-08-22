import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/podcast/models/detail.dart';
import 'package:flutter_music/sections/podcast/models/detail_list.dart';
import 'action.dart';
import 'state.dart';

Effect<PodcastDetailState>? buildEffect() {
  return combineEffects(<Object, Effect<PodcastDetailState>>{
    PodcastDetailAction.action: _onAction,
    Lifecycle.initState: _initState,
    PodcastDetailAction.onTapError: _onTapError,
    PodcastDetailAction.onTapItem: _onTapItem,
  });
}

void _initState(Action action, Context<PodcastDetailState> ctx) async {
  PodcastDetailWrap wrap =
      await CommonService.getDJCatelistDetail(ctx.state.rid!).catchError(
          (e) => ctx.dispatch(PodcastDetailActionCreator.didErrorAction()));

  if (wrap.code != null && wrap.code == 200) {
    PodcastDetailListWrap listWrap =
        await CommonService.getDJCatelistDetaillist(ctx.state.rid!);

    ctx.dispatch(PodcastDetailActionCreator.didFetchDataAction(
        wrap, listWrap.programs ?? []));
  } else {
    ctx.dispatch(PodcastDetailActionCreator.didErrorAction());
  }
}

void _onTapError(Action action, Context<PodcastDetailState> ctx) {
  _initState(action, ctx);
}

void _onTapItem(Action action, Context<PodcastDetailState> ctx) {
  final DetailProgramsItem item = action.payload;
  print(">>>>>>>>>>>id:${item.id}");
}

void _onAction(Action action, Context<PodcastDetailState> ctx) {}
