import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/models/search_default.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/textfield.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.backgroundColor,
    appBar: GpAppBar(
      elevation: 0,
      backgroundColor: CommonColors.foregroundColor,
      titleSpacing: 0,
      title: CustomTextFieldWidget(
        hintText: state.hintText,
        onSubmit: (String text) =>
            dispatch(SearchActionCreator.onTapSearchAction(text)),
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => dispatch(SearchActionCreator.onTapSearchAction(null)),
          child: Container(
            width: 44,
            height: 44,
//            color: Colors.red,
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: Text(
              "搜索",
              style: GpOtherTheme.size15(viewService.context),
            ),
          ),
        )
      ],
    ),
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return _buildBody(state, dispatch, viewService);
        },
      ),
    ),
  );
}

Widget _buildBody(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildTop(state, dispatch, viewService),
      Expanded(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            viewService.buildComponent('history'),
            viewService.buildComponent('recommend'),
            viewService.buildComponent('hot'),
          ],
        ),
      ))
    ],
  );
}

Widget _buildTop(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: CommonColors.foregroundColor,
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Row(
      children: state.items
          .map((e) =>
              Expanded(child: _buildTopItem(state, dispatch, viewService, e)))
          .toList(),
    ),
  );
}

Widget _buildTopItem(SearchState state, Dispatch dispatch,
    ViewService viewService, SearchTopModel model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "assets/images/${model.imageNamed}",
        color: Colors.red,
      ),
      Text(
        model.text ?? "",
        style: GpOtherTheme.size15(viewService.context)!
            .copyWith(fontWeight: FontWeight.bold),
      )
    ],
  );
}
