import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/sections/Leaderboard/widget/official.dart';

Widget buildView(
    ToplistDetailSection section, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15, top: 20, bottom: 15),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/images/icon_logo.png",
                width: 25,
                height: 25,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12.5)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                section.title ?? "",
                style: GpOtherTheme.size15(viewService.context)!
                    .copyWith(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      TopOfficialWidget(
        dispatch: dispatch,
        section: section,
      )
    ],
  );
}
