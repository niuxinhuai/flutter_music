import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/page/detail/total/page.dart';
import 'package:flutter_music/utils/search_util.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/segment.dart';
import 'package:flutter_music/widgets/textfield.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.backgroundColor,
    appBar: GpAppBar(
      elevation: 0,
      backgroundColor: CommonColors.foregroundColor,
      titleSpacing: 0,
      title: CustomTextFieldWidget(
        hintText: state.hint,
        text: state.text,
        onSubmit: (String text) =>
            dispatch(SearchDetailActionCreator.onTapSubmitAction(text)),
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => dispatch(SearchDetailActionCreator.onTapCleanAction()),
          child: Container(
            width: 44,
            height: 44,
//            color: Colors.red,
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: Text(
              "清空",
              style: GpOtherTheme.size15(viewService.context),
            ),
          ),
        )
      ],
    ),
    body: _buildBody(state, dispatch, viewService),
  );
}

Widget _buildBody(
    SearchDetailState state, Dispatch dispatch, ViewService viewService) {
  return TabBarSegmentController(
      useScaffold: false,
      tabTitles: SearchUtils.map.keys.toList(),
      children: SearchUtils.map.values
          .map((e) => SearchResultTotalPage()
              .buildPage({"type": e, "text": state.text}))
          .toList());
}
