import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/repository/database/common_database.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/page/search/action.dart';
import 'package:flutter/material.dart' as P;
import 'action.dart';
import 'state.dart';

Effect<SearchHistoryState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchHistoryState>>{
    SearchHistoryAction.action: _onAction,
    Lifecycle.initState: _initState,
    SearchHistoryAction.onClean: _onClean,
    SearchHistoryAction.onTapItem: _onTapItem,
    SearchHistoryAction.onRefresh: _onRefresh,
  });
}

void _initState(Action action, Context<SearchHistoryState> ctx) async {
  List<UserSearchLog> logs = await CommonDb.getAllSearchHistoryLog();
//  print(">>>>>>>>>>>logs:${logs.length}");
  ctx.dispatch(SearchHistoryActionCreator.didFetchDataAction(logs));
}

void _onTapItem(Action action, Context<SearchHistoryState> ctx) {
  final UserSearchLog log = action.payload;
  ctx.dispatch(SearchActionCreator.onTapSearchAction(log.keyWords ?? ""));
}

void _onRefresh(Action action, Context<SearchHistoryState> ctx) {
  _initState(action, ctx);
}

///全部清除
void _onClean(Action action, Context<SearchHistoryState> ctx) async {
  P.showDialog(
      context: ctx.context,
      builder: (P.BuildContext context) {
        return P.AlertDialog(
          content: P.Text(
            '是否清理全部搜索历史记录？清空后将无法被恢复',
            style: GpOtherTheme.size16(context),
            textAlign: P.TextAlign.center,
          ),
          actions: [
            P.Row(
              mainAxisAlignment: P.MainAxisAlignment.spaceAround,
              children: [
                P.GestureDetector(
                  onTap: () {
                    ARouter.close(context);
                  },
                  child: P.Container(
                    decoration: P.BoxDecoration(
                        color: CommonColors.disableColor,
                        borderRadius:
                            P.BorderRadius.all(P.Radius.circular(20.0))),
                    padding: P.EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: P.Text('取消'),
                  ),
                ),
                P.GestureDetector(
                  onTap: () {
                    ARouter.close(context);
                    _cleanAllSource(action, ctx);
                  },
                  child: P.Container(
                    decoration: P.BoxDecoration(
                        color: CommonColors.disableColor,
                        borderRadius:
                            P.BorderRadius.all(P.Radius.circular(20.0))),
                    padding: P.EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: P.Text('确定'),
                  ),
                )
              ],
            )
          ],
        );
      });
}

void _cleanAllSource(Action action, Context<SearchHistoryState> ctx) async {
  await CommonDb.deleteUserSearchHistory();
  _initState(action, ctx);
}

void _onAction(Action action, Context<SearchHistoryState> ctx) {}
