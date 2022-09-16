import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/widget/history_header.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchHistoryState state, Dispatch dispatch, ViewService viewService) {
  return _buildBody(state, dispatch, viewService);
}

Widget _buildBody(
    SearchHistoryState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: SearchHistoryHeaderWidget(
            imageNamed: "cm6_search_history_delete~iphone.png",
            text: "历史",
            callback: () =>
                dispatch(SearchHistoryActionCreator.onCleanAction()),
          ),
        ),
        _buildWrapWidget(state, dispatch, viewService)
      ],
    ),
  );
}

Widget _buildWrapWidget(
    SearchHistoryState state, Dispatch dispatch, ViewService viewService) {
  if (state.logs.isEmpty) {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.center,
      child: Text(
        "快去搜索更多干货资源吧～",
        style: GpOtherTheme.size14(viewService.context)
            .copyWith(color: CommonColors.textColor999),
      ),
    );
  }

  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children:
        state.logs.map((e) => _buildItem(e, dispatch, viewService)).toList(),
  );
}

Widget _buildItem(
    UserSearchLog item, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(SearchHistoryActionCreator.onTapItemAction(item)),
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
          color: CommonColors.foregroundColor,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Text(
        item.keyWords ?? "",
        style: GpOtherTheme.size13(viewService.context)!
            .copyWith(color: CommonColors.textColor999),
      ),
    ),
  );
}
