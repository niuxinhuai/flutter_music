import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';

class ColorUtils {
  static Map<String, Color> colorMap() => {
        "blue": Colors.blue,
        "red": Colors.red,
        "gray": CommonColors.textColor999,
        "colorPrimary1": Colors.red,
        "colorSecondary7": Colors.green,
      };
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
