import 'package:flutter/material.dart';
import 'colors.dart';

class GpOtherTheme {
  ///题目 20号 绿色 #43C494 加粗
  static TextStyle? size20Green(BuildContext context) {
    return Theme.of(context).textTheme.headline4;
  }

  ///内容 19号 #3B454F 加粗
  static TextStyle? size19(BuildContext context) {
    return Theme.of(context).textTheme.headline5;
  }

  ///段落标题 18号 #3B454F 加粗
  static TextStyle? size18(BuildContext context) {
    return Theme.of(context).textTheme.headline6;
  }

  ///18号 灰色 #999999 加粗
  static TextStyle size18Grey(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: Theme.of(context).hintColor);
  }

  ///内容 17号 #3B454F
  static TextStyle? size17(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2;
  }

  ///内容 16号 #3B454F 加粗
  static TextStyle size16(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CommonColors.textColor666);
  }

  ///内容 15号 #3B454F
  static TextStyle? size15(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1;
  }

  ///15号 灰色 #999999
  static TextStyle size15Grey(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(color: Theme.of(context).hintColor);
  }

  ///15号 绿色
  static TextStyle size15Green(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(color: Theme.of(context).primaryColor);
  }

  ///14号 灰色 #999999
  static TextStyle size14Grey(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(fontSize: 14, color: Theme.of(context).hintColor);
  }

  static TextStyle size14(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14);
  }

  ///13号 #3B454F
  static TextStyle? size13(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2;
  }

  ///12号 #3B454F
  static TextStyle? size12(BuildContext context) {
    return Theme.of(context).textTheme.caption;
  }

  ///11号 #999999
  static TextStyle size11Grey(BuildContext context) {
    return TextStyle(fontSize: 11, color: Theme.of(context).hintColor);
  }

  ///13号 灰色 #999999
  static TextStyle size13Grey(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(color: Theme.of(context).hintColor);
  }

  ///音标 14号 #999999
  static TextStyle phonetic(BuildContext context) {
    return TextStyle(
        fontFamily: 'NotoSerif',
        fontSize: 14,
        color: Theme.of(context).hintColor);
  }

  ///音标 14号 #999999
  static TextStyle essayTextStyle(BuildContext context) {
    return TextStyle(
        fontFamily: 'TIMES_NEW_ROMAN',
        fontSize: 21,
        color: Theme.of(context).colorScheme.onSurface,
        height: 1.6);
  }
}
