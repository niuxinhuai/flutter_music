import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/widget/header.dart';
import 'package:flutter_music/sections/home/widget/toplist.dart';

Widget buildView(MusicItem item, Dispatch dispatch, ViewService viewService) {
  double size = MediaQuery.of(viewService.context).size.width;
  double itemSie = size - 15 - 10 - 30;

  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    margin: const EdgeInsets.only(bottom: 10),
    color: CommonColors.foregroundColor,
    child: Stack(
      children: [
        Positioned(
          top: 10,
          right: 0,
          child: Image.asset(
            "assets/images/cm8_home_toplist_bg~iphone.png",
//          fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 20,
          child: Image.asset(
            "assets/images/cm8_home_toplist_bottom_bg~iphone.png",
//          fit: BoxFit.fill,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RHeaderWidget(
              item: item,
              dispatch: dispatch,
            ),
            if (item.creatives != null && item.creatives?.isNotEmpty == true)
              SingleChildScrollView(
                padding: EdgeInsets.only(right: 15),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: item.creatives!.map((e) {
//                int index = item.creatives!.indexOf(e);
                    return Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: ToplistItemWidget(
                        item: e,
                        size: itemSie,
                        dispatch: dispatch,
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        )
      ],
    ),
  );
}
