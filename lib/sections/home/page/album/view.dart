import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/widget/segment.dart';

Widget buildView(MusicItem state, Dispatch dispatch, ViewService viewService) {
  double size = MediaQuery.of(viewService.context).size.width;
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    color: CommonColors.foregroundColor,
    child: SegmentWidget(
      item: state,
      width: size,
      dispatch: dispatch,
    ),
  );
}
