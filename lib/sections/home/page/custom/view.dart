import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/models/home_module.dart';
import 'package:flutter_music/sections/home/page/action.dart';

Widget buildView(MusicItem item, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: CommonColors.foregroundColor,
        border:
            Border(bottom: BorderSide(color: CommonColors.divider, width: 1))),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      child: Row(
        children: HomeModule.titles.map((e) {
          int index = HomeModule.titles.indexOf(e);
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 27),
            child: GestureDetector(
              onTap: () =>
                  dispatch(HomeMusicActionCreator.onTapCustomIconAction(e)),
              child:
                  HomeModule.customCircleWidget(e, HomeModule.iconDatas[index]),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
