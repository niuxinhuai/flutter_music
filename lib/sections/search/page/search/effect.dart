import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/repository/database/common_database.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/search/models/search_default.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';
import 'package:flutter_music/sections/search/page/search/history/action.dart';
import 'package:flutter_music/utils/time_utl.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchAction.action: _onAction,
    Lifecycle.initState: _initState,
    SearchAction.onTapSearch: _onTapSearch,
  });
}

void _initState(Action action, Context<SearchState> ctx) async {
  List<String> textList = ["歌手", "曲风", "专区", "识曲"];
  List<String> imageList = [
    "cm2_lay_icn_artist_new~iphone.png",
    "cm2_lay_icn_type~iphone.png",
    "cm2_lay_icn_similar_new~iphone.png",
    "cm8_nav_icn_searchmic~iphone.png"
  ];
  ctx.state.items = textList
      .map((e) => SearchTopModel()
        ..text = e
        ..imageNamed = imageList[textList.indexOf(e)])
      .toList();

  SearchHotWrap? hotWrap = await CommonService.getSearchHotData();
  SearchRecommendWrap? wrap = await CommonService.getSearchRecommendHot();
  List<UserSearchLog> logs = await CommonDb.getAllSearchHistoryLog();
  if (hotWrap != null &&
      hotWrap.code == 200 &&
      wrap != null &&
      wrap.code == 200) {
    ctx.dispatch(SearchActionCreator.didFetchDataAction(hotWrap, wrap, logs));
  }
}

void _onTapSearch(Action action, Context<SearchState> ctx) {
  final String? text = action.payload;
  String searchText = text ?? (ctx.state.hintText ?? "");
//  ctx.state.searchText
  if (searchText.isNotEmpty) {
    print(">>>>>>>>>>>>搜索结果:$searchText");
    UserSearchLog log = UserSearchLog();
    log.keyWords = searchText;
    log.time = TimeUtils.getApartSeconds();
    CommonDb.updateSearchHistoryLog(log);
    ARouter.open(ctx.context, RouterKeys.search_detail, params: {
      "text": searchText,
      "hint": ctx.state.hintText
    }).then(
        (value) => ctx.dispatch(SearchHistoryActionCreator.onRefreshAction()));
  }
}

void _onAction(Action action, Context<SearchState> ctx) {}
