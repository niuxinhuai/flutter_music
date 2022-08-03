import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';

class ApplicationModule {
  static const List<String> tabTitles = ['发现', '播客', '我的', '关注', '云村'];
  static List<Widget> icons = [
    iconWidget("cm8_btm_icn_discovery~iphone.png"),
    iconWidget("cm8_btm_icn_voice~iphone.png"),
    iconWidget("cm8_btm_icn_music~iphone.png"),
    iconWidget("cm8_btm_icn_event~iphone.png"),
    iconWidget("cm8_btm_icn_friend~iphone.png")
  ];

  static List<Widget> activeIcons = [
    activeIconWidget("cm8_btm_icn_discovery~iphone.png"),
    activeIconWidget("cm8_btm_icn_voice~iphone.png"),
    activeIconWidget("cm8_btm_icn_music~iphone.png"),
    activeIconWidget("cm8_btm_icn_event~iphone.png"),
    activeIconWidget("cm8_btm_icn_friend~iphone.png")
  ];

  static List<BottomNavigationBarItem> bottomTabs = tabTitles
      .map((e) => BottomNavigationBarItem(
          icon: icons[tabTitles.indexOf(e)],
          activeIcon: activeIcons[tabTitles.indexOf(e)],
          label: e,
          backgroundColor: Colors.red))
      .toList();

  static Widget iconWidget(String named) {
    return Image.asset(
      'assets/images/$named',
      color: CommonColors.textColor999,
    );
  }

  static Widget activeIconWidget(String named) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Colors.red,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFF9C9E),
                Color(0xFFFF6A6D),
                Color(0xFFFF3A3A),
              ])),
      child: Image.asset(
        'assets/images/$named',
        color: CommonColors.onPrimaryTextColor,
      ),
    );
  }
}
