import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/widget/broadcast.dart';

Widget buildView(MusicItem item, Dispatch dispatch, ViewService viewService) {
  double size = MediaQuery.of(viewService.context).size.width;
  double itemSize = (size - 30 - 60) / 3.0;
  String title = item.uiElement?.subTitle?.title ?? "";
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    color: CommonColors.foregroundColor,
    padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color(0xFF2F363F),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15),
            child: Row(
              children: [
                Text(
                  title,
                  style: GpOtherTheme.size17(viewService.context)!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CommonColors.onPrimaryTextColor,
                      fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7),
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black, // 阴影的颜色
                        offset: Offset(10, 20), // 阴影与容器的距离
                        blurRadius: 45.0, // 高斯的标准偏差与盒子的形状卷积。
                        spreadRadius: 0.0, // 在应用模糊之前，框应该膨胀的量。
                      ),
                    ],
                    color: CommonColors.foregroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          if (item.creatives != null &&
              item.creatives?.isNotEmpty == true &&
              item.creatives!.first.resources?.isNotEmpty == true)
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 5, right: 15, bottom: 15, top: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: item.creatives!.first.resources!
                    .map((e) => Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                              BroadcastItemWidget(item: e, itemSize: itemSize),
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    ),
  );
}
