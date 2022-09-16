import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';
import 'package:flutter_music/sections/search/widget/history_header.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchRecommendState state, Dispatch dispatch, ViewService viewService) {
  return _buildBody(state, dispatch, viewService);
}

Widget _buildBody(
    SearchRecommendState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: SearchHistoryHeaderWidget(
            imageNamed: "cm8_refresh_new_items~iphone.png",
            text: "推荐",
            callback: () {},
          ),
        ),
        _buildWrapWidget(state, dispatch, viewService)
      ],
    ),
  );
}

Widget _buildWrapWidget(
    SearchRecommendState state, Dispatch dispatch, ViewService viewService) {
  if (state.recommendWrap?.result?.hots == null ||
      state.recommendWrap?.result?.hots?.isEmpty == true) {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.center,
      child: Text(
        "暂无推荐哦～",
        style: GpOtherTheme.size14(viewService.context)
            .copyWith(color: CommonColors.textColor999),
      ),
    );
  }

  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children: state.recommendWrap!.result!.hots!
        .map((e) => _buildItem(e, dispatch, viewService))
        .toList(),
  );
}

Widget _buildItem(
    SearchRecommendHotsItem item, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(SearchRecommendActionCreator.onTapItemAction(item)),
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
          color: CommonColors.foregroundColor,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Text(
        item.first ?? "",
        style: GpOtherTheme.size13(viewService.context)!
            .copyWith(color: CommonColors.textColor999),
      ),
    ),
  );
}
