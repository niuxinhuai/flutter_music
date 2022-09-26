import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/models/search_voice.dart';
import 'package:flutter_music/utils/search_util.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchSimpleState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchSimpleState>>{
    SearchSimpleAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SearchSimpleState> ctx) async {
  if (ctx.state.type == SearchUtils.voice) {
    SearchVoiceWrap? wrap = await CommonService.getSearchDetailVoice(
        ctx.state.text!, ctx.state.type!);
    if (wrap != null && wrap.code == 200) {
      ctx.dispatch(SearchSimpleActionCreator.didFetchVoiceDataAction(wrap));
    }
  } else {
    SearchResultWrap? wrap = await CommonService.getSearchDetailCategory(
        ctx.state.text!, ctx.state.type!);
    if (wrap != null && wrap.code == 200) {
      ctx.dispatch(SearchSimpleActionCreator.didFetchDataAction(wrap));
    }
  }
}

void _onAction(Action action, Context<SearchSimpleState> ctx) {}
