import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/Leaderboard/models/Leaderboard.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/utils/typeUtils.dart';
import 'action.dart';
import 'state.dart';

Effect<LeaderboardState>? buildEffect() {
  return combineEffects(<Object, Effect<LeaderboardState>>{
    LeaderboardAction.action: _onAction,
    Lifecycle.initState: _initState,
    LeaderboardAction.onTapGridItem: _onTapGridItem,
  });
}

void _initState(Action action, Context<LeaderboardState> ctx) async {
  LeaderboardWrap wrap = await CommonService.getToplistDetail().catchError(
      (e) => ctx.dispatch(LeaderboardActionCreator.didErrorAction()));
  if (wrap.code != null && wrap.code == 200) {
    List<ToplistDetailSection> sections = getSections(wrap);
    ctx.dispatch(LeaderboardActionCreator.didFetchDataAction(wrap, sections));
  } else {
    ctx.dispatch(LeaderboardActionCreator.didErrorAction());
  }
}

List<ToplistDetailSection> getSections(LeaderboardWrap wrap) {
  List<ToplistDetailSection> sections = [];
  if (wrap.list == null || wrap.list?.isEmpty == true) {
    return sections;
  }
  //推荐榜单
  ToplistDetailSection recommendSection = ToplistDetailSection();
  recommendSection.title = ToplistDetailUtils.top;

  //官方榜单
  ToplistDetailSection officialSection = ToplistDetailSection();
  officialSection.title = ToplistDetailUtils.official;

  //精选榜单
  ToplistDetailSection chosenSection = ToplistDetailSection();
  chosenSection.title = ToplistDetailUtils.chosen;

  //曲风榜单
  ToplistDetailSection melodySection = ToplistDetailSection();
  melodySection.title = ToplistDetailUtils.melody;

  //全球榜
  ToplistDetailSection worldSection = ToplistDetailSection();
  worldSection.title = ToplistDetailUtils.world;

  //语种榜
  ToplistDetailSection languageSection = ToplistDetailSection();
  languageSection.title = ToplistDetailUtils.language;

  //特色榜单
  ToplistDetailSection featureSection = ToplistDetailSection();
  featureSection.title = ToplistDetailUtils.feature;

  //ACG榜单
  ToplistDetailSection acgSection = ToplistDetailSection();
  acgSection.title = ToplistDetailUtils.acg;

  for (BoardListItem item in wrap.list!) {
    ///榜单推荐
    if (ToplistDetailUtils.top_list.contains(item.name)) {
      recommendSection.items.add(item);
    }

    ///官方榜单
    if (ToplistDetailUtils.official_list.contains(item.name)) {
      officialSection.items.add(item);
    }

    ///精选榜单
    if (ToplistDetailUtils.chosen_list.contains(item.name)) {
      chosenSection.items.add(item);
    }

    ///曲风榜单
    if (ToplistDetailUtils.melody_list.contains(item.name)) {
      melodySection.items.add(item);
    }

    ///全球榜
    if (ToplistDetailUtils.world_list.contains(item.name)) {
      worldSection.items.add(item);
    }

    ///语种榜
    if (ToplistDetailUtils.language_list.contains(item.name)) {
      languageSection.items.add(item);
    }

    ///ACG榜单
    if (ToplistDetailUtils.acg_list.contains(item.name)) {
      acgSection.items.add(item);
    }

    ///特色榜单
    if (ToplistDetailUtils.feature_list.contains(item.name)) {
      featureSection.items.add(item);
    }
  }

  ///榜单推荐
  if (recommendSection.items.isNotEmpty) {
    sections.add(recommendSection);
  }

  ///官方榜单
  if (officialSection.items.isNotEmpty) {
    sections.add(officialSection);
  }

  ///精选榜单
  if (chosenSection.items.isNotEmpty) {
    sections.add(chosenSection);
  }

  ///曲风榜单
  if (melodySection.items.isNotEmpty) {
    sections.add(melodySection);
  }

  ///全球榜
  if (worldSection.items.isNotEmpty) {
    sections.add(worldSection);
  }

  ///语种榜
  if (languageSection.items.isNotEmpty) {
    sections.add(languageSection);
  }

  ///ACG榜单
  if (acgSection.items.isNotEmpty) {
    sections.add(acgSection);
  }

  ///特色榜单
  if (featureSection.items.isNotEmpty) {
    sections.add(featureSection);
  }
  return sections;
}

///所有榜单，item点击
void _onTapGridItem(Action action, Context<LeaderboardState> ctx) {
  final BoardListItem item = action.payload;
  print(">>>>>>>>>id:${item.id}");
  ARouter.open(ctx.context, RouterKeys.playlist_detail, params: {
    "id": item.id!.toString(),
    "coverImgUrl": item.coverImgUrl ?? ""
  });
  return;
  if (item.name == ToplistDetailType.top_compile) {
    ///编辑推荐榜
  } else {
    print(">>>>>>>>>id:${item.id}");
    ARouter.open(ctx.context, RouterKeys.playlist_detail, params: {
      "id": item.id!.toString(),
      "coverImgUrl": item.coverImgUrl ?? ""
    });
  }
}

void _onAction(Action action, Context<LeaderboardState> ctx) {}
