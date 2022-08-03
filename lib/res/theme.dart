import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData getAppTheme({bool isDarkMode = false}) {
  return ThemeData(
    dividerColor: CommonColors.divider,
    primarySwatch: CommonColors.primary,
    primaryColor: CommonColors.primary,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    primaryColorBrightness: isDarkMode ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: CommonColors.backgroundColor,
    backgroundColor: CommonColors.backgroundColor,
    //checkbox radio switch 选中颜色
    toggleableActiveColor: CommonColors.divider,
    disabledColor: CommonColors.disableColor,
    unselectedWidgetColor: CommonColors.disableColor,
    cardColor: CommonColors.foregroundColor,
    hintColor: CommonColors.textColor999,
    errorColor: CommonColors.hintErrorTextColor,
    bottomAppBarColor: CommonColors.foregroundColor,
    canvasColor: CommonColors.backgroundColor,
    //InkWell按下效果
    highlightColor: CommonColors.keyboardPressBgColor,
    //InkWell波纹扩散颜色
    splashColor: Color(0x66c8c8c8),
    //选择行颜色
    selectedRowColor: Color(0xfff5f5f5),
    secondaryHeaderColor: Color(0xffe3f2fd),
    indicatorColor: CommonColors.secondary,

    fontFamily: 'SFCompact',

    colorScheme: ColorScheme(
      primary: CommonColors.primary,
      primaryVariant: CommonColors.primary,
      secondary: CommonColors.secondary,
      secondaryVariant: CommonColors.secondary,

      //前景色
      surface: CommonColors.foregroundColor,
      background: CommonColors.backgroundColor,
      error: CommonColors.hintErrorTextColor,

      //在primary位置的字的颜色
      onPrimary: CommonColors.onPrimaryTextColor,
      onSecondary: CommonColors.onPrimaryTextColor,
      onSurface: CommonColors.onSurfaceTextColor,
      onBackground: CommonColors.onSurfaceTextColor,
      onError: CommonColors.hintErrorTextColor,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    ),

    ///appBarTheme
    appBarTheme: AppBarTheme(
        toolbarTextStyle: TextStyle(
          color: CommonColors.onSurfaceTextColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        titleTextStyle: TextStyle(
          color: CommonColors.onSurfaceTextColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        color: CommonColors.foregroundColor,
        actionsIconTheme: IconThemeData(color: CommonColors.appbarIconColor),
        iconTheme: IconThemeData(color: CommonColors.appbarIconColor),
        elevation: 1,
        //这个指的是状态栏字的颜色
        systemOverlayStyle: isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark),

    tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: CommonColors.secondary, width: 2)),
        labelColor: CommonColors.onSurfaceTextColor,
        unselectedLabelColor: CommonColors.onSurfaceTextColor,
        labelStyle: TextStyle(
          color: CommonColors.onSurfaceTextColor,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        unselectedLabelStyle: TextStyle(
          color: CommonColors.onSurfaceTextColor,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        )),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: CommonColors.primary,
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      minWidth: 0,
      height: 0,
      alignedDropdown: false,
      buttonColor: CommonColors.primary,
      disabledColor: CommonColors.disableColor,
      highlightColor: CommonColors.primary,
    ),

    ///icon
    iconTheme: IconThemeData(
      color: CommonColors.appbarIconColor,
      opacity: 1.0,
      size: 24.0,
    ),
    primaryIconTheme: IconThemeData(
      color: CommonColors.appbarIconColor,
      opacity: 1.0,
      size: 24.0,
    ),
    dialogTheme: DialogTheme(
        backgroundColor: CommonColors.foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        elevation: 24,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        contentTextStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            height: 1.3)),

    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 96.0,
        fontWeight: FontWeight.normal,
      ),
      //showDatePicker里的date使用
      headline2: TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.normal,
      ),
      headline3:
          TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal, height: 2),

      ///绿色标题
      headline4: TextStyle(
        color: CommonColors.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      ///大标题  例如：showDatePicker里的month、year使用
      headline5: TextStyle(
        fontSize: 19.0,
        fontWeight: FontWeight.bold,
      ),

      ///段落标题  例如：AppBar.title和AlertDialog.title
      headline6: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),

      ///次标题  例如：ListView 中ListTile.title
      subtitle1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.normal,
      ),

      ///小标题
      subtitle2: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.normal,
      ),

      ///默认
      bodyText2: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.normal,
      ),

      ///说明文字
      bodyText1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.normal,
      ),

      ///图表的标题栏
      caption: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),

      ///按钮
      button: TextStyle(
        color: CommonColors.onPrimaryTextColor,
        fontSize: 17.0,
        fontWeight: FontWeight.normal,
      ),

      overline: TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
