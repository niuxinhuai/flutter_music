import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SquareRecommendState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter? adapter = viewService.buildAdapter();
  return LoadingWrap(
    loadingState: state.loadingState,
    successChild: Builder(
      builder: (context) {
        return Container(
          color: CommonColors.backgroundColor,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0, bottom: 20),
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: adapter!.itemCount,
            itemBuilder: adapter.itemBuilder!,
          ),
        );
      },
    ),
  );
}
