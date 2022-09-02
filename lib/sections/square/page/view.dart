import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/square/page/child/page.dart';
import 'package:flutter_music/sections/square/page/recommend/page.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/segment.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PlaylistSquareState state, Dispatch dispatch, ViewService viewService) {
  return LoadingWrap(
    loadingState: state.loadingState,
    successChild: Builder(
      builder: (context) {
//        return Container();
        return TabBarSegmentController(
          tabTitles: state.items!.map((e) => e.name).toList(),
          children: state.items!
              .map((e) => Container(
                    color: CommonColors.foregroundColor,
                    child: e.name! == "推荐"
                        ? SquareRecommendPage().buildPage({})
                        : SquareChildPage().buildPage({"name": e.name}),
                  ))
              .toList(),
          navgationTitle: state.title,
          actions: [
            GestureDetector(
              onTap: () =>
                  dispatch(PlaylistSquareActionCreator.onTapEditButtonAction()),
              child: Container(
                width: 44,
                height: 44,
                child: Image.asset(
                  'assets/images/cm2_edit_QRcode~iphone.png',
                  color: CommonColors.textColor999,
                ),
              ),
            )
          ],
        );
      },
    ),
  );
}
