import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchHotState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchHotState>>{
    SearchHotAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SearchHotState> ctx) async {}

void _onAction(Action action, Context<SearchHotState> ctx) {}
