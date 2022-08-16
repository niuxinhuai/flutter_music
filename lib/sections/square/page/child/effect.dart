import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/repository/share_preferences/sp.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/sections/square/widget/tag.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<SquareChildState>? buildEffect() {
  return combineEffects(<Object, Effect<SquareChildState>>{
    SquareChildAction.action: _onAction,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    SquareChildAction.onLoading: _onLoading,
    SquareChildAction.onErrorTap: _onErrorTap,
    SquareChildAction.onFilterTap: _onFilterTap,
    SquareChildAction.onTapItem: _onTapItem,
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
  PlaylistSquareWrap wrap;
  if (ctx.state.tag == "精品") {
    ctx.state.childCat = await SpUtil.getSquareTag() ?? "";
    ctx.state.limit = 12;
    ctx.state.lastItemBeforeTime =
        (ctx.state.stages != null && ctx.state.stages?.isNotEmpty == true)
            ? ctx.state.stages!.last.updateTime
            : 0;
    wrap = await CommonService.getHighqualityPlayList(
            cat: ctx.state.childCat!,
            limit: ctx.state.limit!,
            before: ctx.state.lastItemBeforeTime!)
        .catchError((e) {
      ///出错只在offset 为0做显示占位图处理，不为0时，toast提示，界面正常显示
      if (ctx.state.offset == 0) {
        ctx.dispatch(SquareChildActionCreator.didErrorAction());
      } else {
        Toast.toast(ctx.context, "获取数据失败");
      }
    });
  } else {
    wrap = await CommonService.getSongPlaylist(
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
  }

  if (wrap.code != null && wrap.code == 200) {
    return wrap;
  }
  return null;
}

void _onErrorTap(Action action, Context<SquareChildState> ctx) {
  _initState(action, ctx);
}

///精品页筛选按钮点击
void _onFilterTap(Action action, Context<SquareChildState> ctx) async {
  ///点击了精品页的筛选
  if (ctx.state.tagsWrap == null) {
    ctx.state.tagsWrap = await CommonService.getHighqualityTagsList();
  }
  if (ctx.state.tagsWrap != null &&
      ctx.state.tagsWrap?.tags != null &&
      ctx.state.tagsWrap?.tags?.isNotEmpty == true) {
    ///展示sheet
    P.showModalBottomSheet(
        context: ctx.context,
        builder: (P.BuildContext context) {
          return TagsListWidget(
            tags: ctx.state.tagsWrap!.tags,
            callback: (String name) {
              if (ctx.state.childCat == name) {
                P.Navigator.pop(ctx.context);
              } else {
                SpUtil.setSquareTag(name);

                ctx.dispatch(
                    SquareChildActionCreator.didFilterAndRefreshAction());
                _initState(action, ctx);
                Future.delayed(Duration(seconds: 1), () {
                  P.Navigator.pop(ctx.context);
                });
              }
            },
          );
        },
        backgroundColor: P.Colors.transparent);
  }
}

///item点击
void _onTapItem(Action action, Context<SquareChildState> ctx) {
  PlaylistStage playlistStage = action.payload;
  print(">>>>>>>>>id:${playlistStage.id}");
  ARouter.open(ctx.context, RouterKeys.playlist_detail, params: {
    "id": playlistStage.id!.toString(),
    "coverImgUrl": playlistStage.coverImgUrl ?? ""
  });
}

void _dispose(Action action, Context<SquareChildState> ctx) {
  ctx.state.refreshController?.dispose();
}

void _onAction(Action action, Context<SquareChildState> ctx) {}
