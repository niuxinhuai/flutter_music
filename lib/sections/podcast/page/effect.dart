import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/podcast/models/banner.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/utils/podcast_util.dart';
import 'action.dart';
import 'state.dart';

Effect<PodcastState>? buildEffect() {
  return combineEffects(<Object, Effect<PodcastState>>{
    PodcastAction.action: _onAction,
    Lifecycle.initState: _initState,
    PodcastAction.onTapLeading: _onTapLeading,
    PodcastAction.onTapError: _onTapError,
    PodcastAction.onTapHeaderMore: _onTapHeaderMore,
    PodcastAction.onTapBanner: _onTapBanner,
    PodcastAction.onTapPersonalItem: _onTapPersonalItem,
    PodcastAction.onTapGridItem: _onTapGridItem,
  });
}

void _initState(Action action, Context<PodcastState> ctx) async {
  PodcastWrap wrap =
      await CommonService.getDJCategoryRecommendList().catchError((e) {
    print(">>>>>>>>>>>>.e:$e");
    ctx.dispatch(PodcastActionCreator.didErrorAction());
  });

  PodcastBannerWrap bannerWrap = await CommonService.getDJBanner();
  PersonalizeWrap perfered_wrap = await CommonService.getDJTodayRecommend();

  if (wrap.code != null && wrap.code == 200) {
    if (bannerWrap.code != null && bannerWrap.code == 200) {
      PodcastStage bannerStage = PodcastStage();
      bannerStage.categoryId = PodcastUtils.dj_banner;
      if (wrap.data != null && wrap.data?.isNotEmpty == true) {
        wrap.data!.insert(0, bannerStage);
      }
    }

    ///猜你喜欢
    if (perfered_wrap.code != null && perfered_wrap.code == 200) {
      PodcastStage perferedStage = PodcastStage();
      perferedStage.categoryId = PodcastUtils.dj_perfered;
      perferedStage.categoryName = "猜你喜欢";
      if (wrap.data != null && wrap.data?.isNotEmpty == true) {
        wrap.data!.insert(0, perferedStage);
      }
    }
    ctx.dispatch(PodcastActionCreator.didFeatchDataAction(
        wrap, bannerWrap, perfered_wrap));
  } else {
    ctx.dispatch(PodcastActionCreator.didErrorAction());
  }
}

void _onTapLeading(Action action, Context<PodcastState> ctx) {
  ctx.state.globalKey.currentState?.openDrawer();
}

void _onTapError(Action action, Context<PodcastState> ctx) {
  _initState(action, ctx);
}

///头部更多按钮点击
void _onTapHeaderMore(Action action, Context<PodcastState> ctx) {
  final PodcastStage stage = action.payload;
  print(">>>>>>>>category:${stage.categoryId} name:${stage.categoryName}");
}

///banner
void _onTapBanner(Action action, Context<PodcastState> ctx) {
  final PodcastBannerItem item = action.payload;
  ARouter.open(ctx.context, RouterKeys.web_view, params: {"url": item.url});
}

///猜你喜欢，item点击
void _onTapPersonalItem(Action action, Context<PodcastState> ctx) {
  final PersonalizeItem item = action.payload;
  print(">>>>>>>>>>>>id:${item.id}");
}

///grid，item点击
void _onTapGridItem(Action action, Context<PodcastState> ctx) {
  final RadiosItem item = action.payload;
  print(">>>>>>>>>>>>id:${item.id}");
}

void _onAction(Action action, Context<PodcastState> ctx) {}
