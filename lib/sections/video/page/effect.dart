import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/video/models/detail.dart';
import 'package:flutter_music/sections/video/models/info.dart';
import 'package:flutter_music/sections/video/models/url.dart';
import 'package:flutter_music/sections/video/widget/component_page_widget.dart';
import 'action.dart';
import 'state.dart';

Effect<VideoDetailState>? buildEffect() {
  return combineEffects(<Object, Effect<VideoDetailState>>{
    VideoDetailAction.action: _onAction,
    VideoDetailAction.onTapError: _onTapError,
    Lifecycle.initState: _initState,
    VideoDetailAction.onPlayerProgress: _onPlayerProgress,
    VideoDetailAction.onTapBottomCommentFloor: _onTapBottomCommentFloor,
  });
}

void _initState(Action action, Context<VideoDetailState> ctx) async {
  VideoDetailWrap? detailWrap =
      await CommonService.getVideoDetail(ctx.state.vid!).catchError(
          (e) => ctx.dispatch(VideoDetailActionCreator.didErrorAction()));
  VideoUrlWrap? urlWrap = await CommonService.getVideoUrl(ctx.state.vid!)
      .catchError(
          (e) => ctx.dispatch(VideoDetailActionCreator.didErrorAction()));

  VideoDetailInfoWrap? infoWrap =
      await CommonService.getVideoDetailInfo(ctx.state.vid!).catchError(
          (e) => ctx.dispatch(VideoDetailActionCreator.didErrorAction()));

  if ((detailWrap != null &&
          detailWrap.code != null &&
          detailWrap.code == 200) &&
      (urlWrap != null && urlWrap.code != null && urlWrap.code == 200) &&
      (infoWrap != null && infoWrap.code != null && infoWrap.code == 200)) {
    ctx.dispatch(VideoDetailActionCreator.didFetchDataAction(
        detailWrap, urlWrap, infoWrap));
  } else {
    ctx.dispatch(VideoDetailActionCreator.didErrorAction());
  }
}

void _onPlayerProgress(Action action, Context<VideoDetailState> ctx) {
  Tuple2 tuple2 = action.payload;
  ctx.dispatch(
      VideoDetailActionCreator.didPlayerProgressAction(tuple2.i0, tuple2.i1));
}

///底部评论
void _onTapBottomCommentFloor(Action action, Context<VideoDetailState> ctx) {
  _showBottomSheet(action, ctx);
}

void _showBottomSheet(Action action, Context<VideoDetailState> ctx) {
  P.Size size = P.MediaQuery.of(ctx.context).size;

  P.showModalBottomSheet(
      isScrollControlled: true,
      context: ctx.context,
      builder: (P.BuildContext context) {
        return VideoCommentPage(
          url: ctx.state.url,
          vid: ctx.state.vid,
          position: ctx.state.position,
          width: size.width,
        );
      },
      backgroundColor: CommonColors.foregroundColor);
}

void _onTapError(Action action, Context<VideoDetailState> ctx) {
  _initState(action, ctx);
}

void _onAction(Action action, Context<VideoDetailState> ctx) {}
