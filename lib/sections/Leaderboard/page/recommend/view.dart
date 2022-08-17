import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/sections/Leaderboard/widget/grid_view.dart';

Widget buildView(
    ToplistDetailSection section, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15, top: 20),
        child: Text(
          section.title ?? "",
          style: GpOtherTheme.size20Green(viewService.context)!.copyWith(
              fontWeight: FontWeight.bold,
              color: CommonColors.onSurfaceTextColor),
        ),
      ),
      GridCountWidget(
        dispatch: dispatch,
        section: section,
      )
    ],
  );
}
