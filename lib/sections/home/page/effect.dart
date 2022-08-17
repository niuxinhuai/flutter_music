import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeMusicState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeMusicState>>{
    HomeMusicAction.action: _onAction,
    HomeMusicAction.onRefresh: _onRefresh,
    HomeMusicAction.onTapBanner: _onTapBanner,
    HomeMusicAction.onTapCustomIcon: _onTapCustomIcon,
    HomeMusicAction.onTapRecommendMore: _onTapRecommendMore,
    HomeMusicAction.onTapRecommendItem: _onTapRecommendItem,
    HomeMusicAction.onTapAlbumItem: _onTapAlbumItem,
    HomeMusicAction.onTapYuncunItem: _onTapYuncunItem,
    HomeMusicAction.onTapBroadcastItem: _onTapBroadcastItem,
    HomeMusicAction.onTapCalendarItem: _onTapCalendarItem,
    HomeMusicAction.onTapLeading: _onTapLeading,
    HomeMusicAction.onTapToplistItem: _onTapToplistItem,
    HomeMusicAction.onChildItemScrollLoading: _onChildItemScrollLoading,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<HomeMusicState> ctx) async {
  HomeMusicWrap? wrap = await CommonService.getHomeDataSouce();
  ctx.dispatch(HomeMusicActionCreator.didFetchDataAction(wrap));
}

void _onRefresh(Action action, Context<HomeMusicState> ctx) async {
  HomeMusicWrap? wrap = await CommonService.getHomeDataSouce(refresh: true);
  ctx.dispatch(HomeMusicActionCreator.didRefreshAction(wrap));
}

///点击banner列表
void _onTapBanner(Action action, Context<HomeMusicState> ctx) {
  final MusicBanner banner = action.payload;
  print(">>>>>>>>>>>>>>bannerTap:${banner.typeTitle ?? ""}");
}

///topic 2
void _onTapCustomIcon(Action action, Context<HomeMusicState> ctx) {
  String title = action.payload;
  if (title == "每日推荐") {
    ARouter.open(ctx.context, RouterKeys.every_day_recommend_song);
  } else if (title == "排行榜") {
    ARouter.open(ctx.context, RouterKeys.toplist_detail);
  } else if (title == "歌单") {
    ARouter.open(ctx.context, RouterKeys.square);
  }

  print(">>>>>>>>>>>>>title:$title");
}

///推荐更多按钮/新歌新碟数字专辑更多按钮/云村更多按钮/热门播客，有声书更多按钮/音乐日历/排行榜
void _onTapRecommendMore(Action action, Context<HomeMusicState> ctx) {
  final UiElementButton elementButton = action.payload;
  print(">>>>>>>>>>>>>>>button:${elementButton.action}");
  String actionStr = elementButton.action ?? "";
  String playlistSquare = "playlistCollection";
  if (actionStr.contains(playlistSquare)) {
    ARouter.open(ctx.context, RouterKeys.square, params: {"action": actionStr});
  }
}

///推荐歌单，item点击
void _onTapRecommendItem(Action action, Context<HomeMusicState> ctx) {
  final ResourcesItem item = action.payload;
  print(">>>>>>>>>推荐歌单点击:${item.uiElement?.mainTitle?.title}");
}

///新歌新碟数字专辑 item点击/ 热门播客，有声书 item点击
void _onTapAlbumItem(Action action, Context<HomeMusicState> ctx) {
  final ResourcesItem resourcesItem = action.payload;
}

///云村 item点击
void _onTapYuncunItem(Action action, Context<HomeMusicState> ctx) {
  final ResourcesItem resourcesItem = action.payload;
}

///广播 item点击
void _onTapBroadcastItem(Action action, Context<HomeMusicState> ctx) {
  final ResourcesItem resourcesItem = action.payload;
}

///音乐日历 item点击
void _onTapCalendarItem(Action action, Context<HomeMusicState> ctx) {
  final ResourcesItem resourcesItem = action.payload;
}

///排行榜 item点击
void _onTapToplistItem(Action action, Context<HomeMusicState> ctx) {
  final ResourcesItem resourcesItem = action.payload;
}

///导航条左侧按钮点击
void _onTapLeading(Action action, Context<HomeMusicState> ctx) {
  ctx.state.globalKey.currentState?.openDrawer();
}

///child 可滑动控件，左滑进入下一页操作
void _onChildItemScrollLoading(Action action, Context<HomeMusicState> ctx) {
  final MusicItem item = action.payload;
}

void _onAction(Action action, Context<HomeMusicState> ctx) {}
