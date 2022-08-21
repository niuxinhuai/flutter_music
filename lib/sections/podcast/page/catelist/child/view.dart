import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/widget/catelist_item.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CatelistRecommendState state, Dispatch dispatch, ViewService viewService) {
  return LoadingWrap(
    loadingState: state.loadingState,
    successChild: Builder(
      builder: (context) {
        return _buildBody(state, dispatch, viewService);
      },
    ),
    onErrorTap: () =>
        dispatch(CatelistRecommendActionCreator.onTapErrorAction()),
  );
}

Widget _buildBody(
    CatelistRecommendState state, Dispatch dispatch, ViewService viewService) {
  return ListView.builder(
    padding: EdgeInsets.only(top: 20, bottom: 30, left: 15, right: 15),
    shrinkWrap: true,
    itemCount: state.items?.length ?? 0,
    itemBuilder: (BuildContext context, int index) {
      PersonalizeItem item = state.items![index];
      return CatelistChildItemWidget(
        item: item,
      );
    },
  );
}
