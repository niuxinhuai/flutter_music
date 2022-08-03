import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonColors {
  CommonColors._();

  static bool _isDark = false;

  static refreshIsDark(bool isDark) {
    _isDark = isDark;
  }

  static MaterialColor get primary => _isDark
      ? const MaterialColor(
          0xFF2E8867,
          <int, Color>{
            50: Color(0xFFE6F1ED),
            100: Color(0xFFC0DBD1),
            200: Color(0xFF97C4B3),
            300: Color(0xFF6DAC95),
            400: Color(0xFF4D9A7E),
            500: Color(0xFF2e8867),
            600: Color(0xFF29805F),
            700: Color(0xFF237554),
            800: Color(0xFF1D6B4A),
            900: Color(0xFF125839),
          },
        )
      : const MaterialColor(
          0xFF43c494,
          <int, Color>{
            50: Color(0xFFe8f8f2),
            100: Color(0xFFc7eddf),
            200: Color(0xFFa1e2ca),
            300: Color(0xFF7bd6b4),
            400: Color(0xFF5fcda4),
            500: Color(0xFF43c494),
            600: Color(0xFF3dbe8c),
            700: Color(0xFF34b681),
            800: Color(0xFF2caf77),
            900: Color(0xFF1ea265),
          },
        );

  static MaterialColor get secondary => _isDark
      ? const MaterialColor(
          0xFFB27F35,
          <int, Color>{
            50: Color(0xFFF6F0E7),
            100: Color(0xFFE8D9C2),
            200: Color(0xFFD9BF9A),
            300: Color(0xFFC9A572),
            400: Color(0xFFBE9253),
            500: Color(0xFFB27F35),
            600: Color(0xFFAB7730),
            700: Color(0xFFA26C28),
            800: Color(0xFF996222),
            900: Color(0xFF8A4F16),
          },
        )
      : const MaterialColor(
          0xFFffb74d,
          <int, Color>{
            50: Color(0xFFfff6ea),
            100: Color(0xFFffe9ca),
            200: Color(0xFFffdba6),
            300: Color(0xFFffcd82),
            400: Color(0xFFffc268),
            500: Color(0xFFffb74d),
            600: Color(0xFFffb046),
            700: Color(0xFFffa73d),
            800: Color(0xFFff9f34),
            900: Color(0xFFff9025),
          },
        );

  static Color get randomColor => Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  static Color get backgroundColor =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF4F7FA);

  static Color get foregroundColor =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFFFFFFF);

  static Color get disableColor =>
      _isDark ? const Color(0xFF969EA4) : const Color(0xFFD8E3EB);

  static Color get divider =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFF4F4F4);
  static const Color appbarIconColor = Color(0xFF9BA6AE);

  ///text
  static const Color hintErrorTextColor = Color(0xFFF17D7D);

  static Color get onPrimaryTextColor =>
      _isDark ? const Color(0xFFdddddd) : const Color(0xFFFFFFFF);

  static Color get onSurfaceTextColor =>
      _isDark ? const Color(0xFFdddddd) : const Color(0xFF333333);

  static Color get textColor666 =>
      _isDark ? const Color(0xFF999999) : const Color(0xFF666666);

  static Color get textColor999 =>
      _isDark ? const Color(0xFF666666) : const Color(0xFF999999);

  static Color get textColorDDD =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFDDDDDD);

  ///keyboard
  static Color get keyboardBarBg =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFF1F1F1);
  static const Color keyboardPressBgColor = Color(0x66c8c8c8);

  ///dialog
  static const Color dialogConfirmBtnTextColor = Color(0xFFFDBB46);
  static const Color dialogCancelBtnTextColor = Color(0xFF9BA6AE);

  static const Color videoActionTitleText = Color(0xFF999999);

  ///star
  static const Color star = Color(0xFFB5B5B5);

  static Color get listeningBtnColor1 =>
      _isDark ? secondary : const Color(0xFFFFDA77);

  static Color get listeningBtnColor2 =>
      _isDark ? secondary : const Color(0xFFFF856B);
  static const Color listeningResultWrong = Color(0xFFFF6069);

  static Color get listeningSectionBg =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFF9FAFC);

  static Color get listeningFullArticleSectionBg =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF9FAFC);

  ///gradient
  static Color get barViewDarkYellowColor =>
      _isDark ? secondary : Color(0xFFFFA984);

  static Color get barViewLightYellowColor =>
      _isDark ? secondary : Color(0xFFFFEEC2);
  static const Color circleViewDarkPurpelColor = Color(0xFF8477FF);
  static const Color circleViewLightPurpelColor = Color(0xFFC179FF);

  static Color get primaryGradientColor1 =>
      _isDark ? primary : const Color(0xFF45DC94);

  static Color get primaryGradientColor2 =>
      _isDark ? primary : const Color(0xFF3CD39B);

  static Color get secondaryGradientColor1 =>
      _isDark ? secondary : const Color(0xFFFFDC84);

  static Color get secondaryGradientColor2 =>
      _isDark ? secondary : const Color(0xFFFFB74D);

  static Color get todayDataTopBg1 =>
      _isDark ? const Color(0xFF2D343E) : const Color(0xFF45DC94);

  static Color get todayDataTopBg2 =>
      _isDark ? const Color(0xFF22282C) : const Color(0xFF3CD39B);

  ///switch
  static const Color switchOnColor = Color(0xFF2E8867);

  static Color get homeStatisticsStrokeLineColor =>
      _isDark ? const Color(0xFF2E8867) : const Color(0xFF43C494);

  static Color get essayPieKaoyan => _isDark
      ? const Color(0xFF43C494).withOpacity(0.7)
      : const Color(0xFF43C494);

  static Color get kaoyanPayTwoColor => _isDark
      ? const Color(0xFF1578FF).withOpacity(0.6)
      : const Color(0xFF1578FF);

  static Color get kaoyanPayTextColor =>
      _isDark ? const Color(0xFFA1383F) : const Color(0xFFFD6B4B);

  //水印
  static Color get blurTextColor =>
      _isDark ? const Color(0xFF323943).withOpacity(0.3) : Color(0xFFF7F7F7);
}
