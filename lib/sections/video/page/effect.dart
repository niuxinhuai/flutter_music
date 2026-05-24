import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/video/models/detail.dart';
import 'package:flutter_music/sections/video/models/info.dart';
import 'package:flutter_music/sections/video/models/url.dart';
import 'package:flutter_music/sections/video/widget/component_page_widget.dart';
import 'package:flutter_music/utils/local_media_repository.dart';
import 'package:flutter_music/utils/local_media_store.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<VideoDetailState>? buildEffect() {
  return combineEffects(<Object, Effect<VideoDetailState>>{
    VideoDetailAction.action: _onAction,
    VideoDetailAction.onTapError: _onTapError,
    Lifecycle.initState: _initState,
    VideoDetailAction.onPlayerProgress: _onPlayerProgress,
    VideoDetailAction.onTapDownload: _onTapDownload,
    VideoDetailAction.onTapBottomCommentFloor: _onTapBottomCommentFloor,
  });
}

void _initState(Action action, Context<VideoDetailState> ctx) async {
  VideoDetailWrap? detailWrap = await CommonService.getVideoDetail(
    ctx.state.vid!,
  ).catchError((e) => ctx.dispatch(VideoDetailActionCreator.didErrorAction()));
  VideoUrlWrap? urlWrap = await CommonService.getVideoUrl(
    ctx.state.vid!,
  ).catchError((e) => ctx.dispatch(VideoDetailActionCreator.didErrorAction()));

  VideoDetailInfoWrap? infoWrap = await CommonService.getVideoDetailInfo(
    ctx.state.vid!,
  ).catchError((e) => ctx.dispatch(VideoDetailActionCreator.didErrorAction()));

  if ((detailWrap != null &&
          detailWrap.code != null &&
          detailWrap.code == 200) &&
      (urlWrap != null && urlWrap.code != null && urlWrap.code == 200) &&
      (urlWrap.urls?.isNotEmpty == true) &&
      (urlWrap.urls?.first.url?.isNotEmpty == true) &&
      (infoWrap != null && infoWrap.code != null && infoWrap.code == 200)) {
    ctx.dispatch(
      VideoDetailActionCreator.didFetchDataAction(
        detailWrap,
        urlWrap,
        infoWrap,
      ),
    );
    final sourceUrl =
        urlWrap.urls?.isNotEmpty == true ? urlWrap.urls?.first.url : null;
    if (sourceUrl != null && sourceUrl.isNotEmpty) {
      final resolvedUrl = await LocalMediaRepository.resolvePlaybackPath(
        type: LocalMediaType.video,
        id: ctx.state.vid!,
        fallbackUrl: sourceUrl,
      );
      if (resolvedUrl != sourceUrl) {
        ctx.dispatch(
          VideoDetailActionCreator.didUpdatePlaybackUrlAction(resolvedUrl),
        );
      }
    }
  } else {
    ctx.dispatch(VideoDetailActionCreator.didErrorAction());
  }
}

void _onPlayerProgress(Action action, Context<VideoDetailState> ctx) {
  Tuple2 tuple2 = action.payload;
  ctx.dispatch(
    VideoDetailActionCreator.didPlayerProgressAction(tuple2.i0, tuple2.i1),
  );
}

///底部评论
void _onTapBottomCommentFloor(Action action, Context<VideoDetailState> ctx) {
  _showBottomSheet(action, ctx);
}

void _onTapDownload(Action action, Context<VideoDetailState> ctx) async {
  final sourceUrl = ctx.state.sourceUrl ?? ctx.state.url;
  if (ctx.state.vid == null || sourceUrl == null || sourceUrl.isEmpty) {
    Toast.toast(ctx.context, "暂无可下载视频");
    return;
  }

  try {
    final item = await LocalMediaRepository.download(
      type: LocalMediaType.video,
      id: ctx.state.vid!,
      sourceUrl: sourceUrl,
      title: ctx.state.detailWrap?.data?.title,
    );
    if (!ctx.context.mounted) {
      return;
    }
    ctx.dispatch(
      VideoDetailActionCreator.didUpdatePlaybackUrlAction(item.localPath),
    );
    Toast.toast(ctx.context, "已下载，将优先本地播放");
  } catch (e) {
    if (!ctx.context.mounted) {
      return;
    }
    Toast.toast(ctx.context, "下载失败，请稍后重试");
  }
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
    backgroundColor: CommonColors.foregroundColor,
  );
}

void _onTapError(Action action, Context<VideoDetailState> ctx) {
  _initState(action, ctx);
}

void _onAction(Action action, Context<VideoDetailState> ctx) {}
