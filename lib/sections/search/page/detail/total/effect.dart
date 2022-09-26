import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/search/models/search_multimatch.dart';
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

  SearchMultimatchWrap? multimatchWrap =
      await CommonService.getSearchMultimatch(ctx.state.text!);
  if (wrap != null &&
      wrap.code == 200 &&
      multimatchWrap != null &&
      multimatchWrap.code == 200) {
    ctx.dispatch(SearchResultTotalActionCreator.didFetchDataAction(
        wrap, multimatchWrap));
  }
}

void _onAction(Action action, Context<SearchResultTotalState> ctx) {}
