import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/iconfont.dart';

class HomeModule {
  static const List<String> titles = [
    "每日推荐",
    "私人FM",
    "歌单",
    "排行榜",
    "有声书",
    "数字专辑",
    "直播",
    "关注新歌",
    "歌房"
  ];

  static const List<IconData> iconDatas = [
    IconF.calendarrili,
    IconF.a_tupianyihuifu_05,
    IconF.gedan,
    IconF.paihangbang,
    IconF.tushu,
    IconF.zhuanji,
    IconF.xianchangzhibo,
    IconF.wodeguanzhu,
    IconF.yinlemusic217
  ];

  static Widget customCircleWidget(String title, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        iconWidget(iconData),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 13, color: CommonColors.textColor666),
          ),
        )
      ],
    );
  }

  static Widget iconWidget(IconData data) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color(0xFFFEF5F4)),
      child: Icon(
        data,
        color: Colors.red,
      ),
    );
  }
}
