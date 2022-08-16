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
    IconF.atupianyihuifu05,
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

  static const List<String> drawSectionImageOne = [
    "cm8_setting_message~iphone.png",
    "cm7_more_icon_yunbei~iphone.png"
  ];

  static const List<String> drawSectionTitleOne = ["消息中心", "云贝中心"];

  static const List<String> drawSectionImageTwo = [
    "cm6_set_icn_ticketcenter~iphone.png",
    "cm6_set_icn_store~iphone.png",
    "cm6_set_icn_beat~iphone.png",
    "cm6_set_icn_ring_tone~iphone.png"
  ];

  static const List<String> drawSectionTitleTwo = [
    "云村有票",
    "商城",
    "Beat专区",
    "口袋彩铃"
  ];

  static const List<String> drawSectionImageThree = [
    "cm6_set_icn_set~iphone.png",
    "cm6_set_icn_night~iphone.png",
    "cm6_set_icn_time~iphone.png",
    "cm8_setting_skinSquare~iphone.png",
    "cm8_setting_downloadAfterCache~iphone.png",
    "cm6_set_icn_combo~iphone.png",
    "cm6_set_icn_siri_shortcuts~iphone.png",
    "cm6_set_icn_black_list~iphone.png",
    "cm6_set_icn_youth_mode~iphone.png",
    "cm6_set_icn_alamclock~iphone.png",
  ];

  static const List<String> drawSectionTitleThree = [
    "设置",
    "深色模式",
    "定时关闭",
    "个性装扮",
    "边听边存",
    "在线听歌免流量",
    "添加Siri捷径",
    "音乐黑名单",
    "青少年模式",
    "音乐闹钟"
  ];

  static const List<String> drawSectionImageFour = [
    "cm8_setting_kefu~iphone.png",
    "cm6_set_icn_order~iphone.png",
    "cm6_set_icn_coupon~iphone.png",
    "cm6_set_icn_share~iphone.png",
    "cm6_set_icn_about~iphone.png",
  ];

  static const List<String> drawSectionTitleFour = [
    "我的客服",
    "我的订单",
    "优惠券",
    "分享网易云音乐",
    "关于"
  ];

  static const List<List<String>> drawImageNamedList = [
    drawSectionImageOne,
    drawSectionImageTwo,
    drawSectionImageThree,
    drawSectionImageFour
  ];
  static const List<List<String>> drawTitleList = [
    drawSectionTitleOne,
    drawSectionTitleTwo,
    drawSectionTitleThree,
    drawSectionTitleFour
  ];
}

class DrawerSectionModel {
  DrawerSectionModel();

  String? title;

  List<DrawerCellModel>? models;
}

class DrawerCellModel {
  DrawerCellModel();

  String? imageNamed;
  String? title;
}
