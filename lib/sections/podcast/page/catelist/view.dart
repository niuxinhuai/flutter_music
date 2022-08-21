import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/podcast/widget/catelist_child.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/segment.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CatelistState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.foregroundColor,
    appBar: GpAppBar(
      elevation: 0,
      title: Text("全部分类"),
    ),
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return _buildBody(state, dispatch, viewService);
        },
      ),
      onErrorTap: () => dispatch(CatelistActionCreator.onTapErrorAction()),
    ),
  );
}

Widget _buildBody(
    CatelistState state, Dispatch dispatch, ViewService viewService) {
  return CatelistSegmentWidget(
    titles: state.titles,
    widgets: state.widgets,
    initialIndex: state.initialIndex,
    onTap: (int index) {
      print(">>>>>>>>>点击了:$index");
    },
  );
}
