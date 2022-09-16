import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';
import 'package:flutter_music/sections/search/page/search/action.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchRecommendState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchRecommendState>>{
    SearchRecommendAction.action: _onAction,
    Lifecycle.initState: _initState,
    SearchRecommendAction.onTapItem: _onTapItem,
  });
}

void _initState(Action action, Context<SearchRecommendState> ctx) async {}

void _onTapItem(Action action, Context<SearchRecommendState> ctx) {
  final SearchRecommendHotsItem item = action.payload;
  ctx.dispatch(SearchActionCreator.onTapSearchAction(item.first));
}

void _onAction(Action action, Context<SearchRecommendState> ctx) {}
