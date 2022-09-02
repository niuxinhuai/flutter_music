import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/village/models/source.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<VideoWaterfallState>? buildEffect() {
  return combineEffects(<Object, Effect<VideoWaterfallState>>{
    VideoWaterfallAction.action: _onAction,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    VideoWaterfallAction.onTapError: _onTapError,
    VideoWaterfallAction.onRefresh: _onRefresh,
    VideoWaterfallAction.onLoading: _onLoading,
    VideoWaterfallAction.onTapItem: _onTapItem,
  });
}

void _initState(Action action, Context<VideoWaterfallState> ctx) async {
  VideoSourceWrap? wrap = await _getVideoData(action, ctx);

  if (wrap != null && wrap.code == 200) {
    ctx.dispatch(VideoWaterfallActionCreator.didFetchDataAction(wrap));
  } else {
    Toast.toast(ctx.context, "请求数据出错");
  }
}

Future<VideoSourceWrap?> _getVideoData(
    Action action, Context<VideoWaterfallState> ctx) async {
  VideoSourceWrap? wrap = await CommonService.getVideoGroupListSource(
          ctx.state.id!,
          offset: ctx.state.offset)
      .catchError((e) {
    print(">>>>>>>>>error:$e");
    if (ctx.state.offset == 0) {
      ctx.dispatch(VideoWaterfallActionCreator.didErrorAction());
    } else {
      Toast.toast(ctx.context, "请求数据出错");
    }
  });
  return wrap;
}

void _onTapError(Action action, Context<VideoWaterfallState> ctx) {
  _initState(action, ctx);
}

void _onRefresh(Action action, Context<VideoWaterfallState> ctx) async {
  ctx.state.offset = 0;
  VideoSourceWrap? wrap = await _getVideoData(action, ctx);

  ctx.dispatch(VideoWaterfallActionCreator.didRefreshAction(wrap!));
}

void _onLoading(Action action, Context<VideoWaterfallState> ctx) async {
  VideoSourceWrap? wrap = await _getVideoData(action, ctx);

  ctx.dispatch(VideoWaterfallActionCreator.didLoadingAction(wrap!));
}

void _onTapItem(Action action, Context<VideoWaterfallState> ctx) {
  final VideoSourceItem item = action.payload;

  if (item.data?.vid != null) {
    ARouter.open(ctx.context, RouterKeys.video_detail,
        params: {"vid": item.data?.vid});
  } else {
    Toast.toast(ctx.context, "视频Vid 为空了");
  }
}

void _dispose(Action action, Context<VideoWaterfallState> ctx) {
  ctx.state.refreshController?.dispose();
}

void _onAction(Action action, Context<VideoWaterfallState> ctx) {}
