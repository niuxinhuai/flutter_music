import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<SquareChildState>? buildEffect() {
  return combineEffects(<Object, Effect<SquareChildState>>{
    SquareChildAction.action: _onAction,
    Lifecycle.initState: _initState,
    SquareChildAction.onLoading: _onLoading,
    SquareChildAction.onErrorTap: _onErrorTap,
  });
}

void _initState(Action action, Context<SquareChildState> ctx) async {
  PlaylistSquareWrap? wrap = await _getData(action, ctx);

  if (wrap != null) {
    print(">>>>>>>>>>length:${wrap.playlists?.length}");
    ctx.dispatch(SquareChildActionCreator.didFetchDataAction(wrap));
  } else {
    ///出错只在offset 为0做显示占位图处理，不为0时，toast提示，界面正常显示
    if (ctx.state.offset == 0) {
      ctx.dispatch(SquareChildActionCreator.didErrorAction());
    } else {
      Toast.toast(ctx.context, "返回de数据出问题了");
    }
  }
}

void _onLoading(Action action, Context<SquareChildState> ctx) async {
  PlaylistSquareWrap? wrap = await _getData(action, ctx);

  if (wrap != null) {
    print(">>>>>>>>>>length:${wrap.playlists?.length}");
    ctx.dispatch(SquareChildActionCreator.didLoadingAction(wrap));
  } else {
    Toast.toast(ctx.context, "上啦加载更多返回de数据出问题了");
  }
}

Future<PlaylistSquareWrap?> _getData(
    Action action, Context<SquareChildState> ctx) async {
  PlaylistSquareWrap wrap = await CommonService.getSongPlaylist(
          tag: ctx.state.tag!,
          limit: ctx.state.limit!,
          offset: ctx.state.offset)
      .catchError((e) {
    ///出错只在offset 为0做显示占位图处理，不为0时，toast提示，界面正常显示
    if (ctx.state.offset == 0) {
      ctx.dispatch(SquareChildActionCreator.didErrorAction());
    } else {
      Toast.toast(ctx.context, "获取数据失败");
    }
  });
  if (wrap.code != null && wrap.code == 200) {
    return wrap;
  }
  return null;
}

void _onErrorTap(Action action, Context<SquareChildState> ctx) {
  _initState(action, ctx);
}

void _onAction(Action action, Context<SquareChildState> ctx) {}
