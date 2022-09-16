import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchResultTotalState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchResultTotalState>>{
    SearchResultTotalAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SearchResultTotalState> ctx) async {
  SearchResultWrap? wrap =
      await CommonService.getSearchDetail(ctx.state.text!, ctx.state.type!);
  if (wrap != null && wrap.code == 200) {
    ctx.dispatch(SearchResultTotalActionCreator.didFetchDataAction(wrap));
  }
}

void _onAction(Action action, Context<SearchResultTotalState> ctx) {}
