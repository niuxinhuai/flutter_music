import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData getAppTheme({bool isDarkMode = false}) {
  return ThemeData(
    dividerColor: CommonColors.divider,
    primarySwatch: CommonColors.primary,
    primaryColor: CommonColors.primary,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: CommonColors.backgroundColor,
    disabledColor: CommonColors.disableColor,
    unselectedWidgetColor: CommonColors.disableColor,
    cardColor: CommonColors.foregroundColor,
    hintColor: CommonColors.textColor999,
    bottomAppBarTheme: BottomAppBarTheme(color: CommonColors.foregroundColor),
    canvasColor: CommonColors.backgroundColor,
    //InkWell按下效果
    highlightColor: CommonColors.keyboardPressBgColor,
    //InkWell波纹扩散颜色
    splashColor: Color(0x66c8c8c8),
    secondaryHeaderColor: Color(0xffe3f2fd),
    indicatorColor: CommonColors.secondary,

    fontFamily: 'SFCompact',

    colorScheme: ColorScheme(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primary: CommonColors.primary,
      primaryContainer: CommonColors.primary,
      secondary: CommonColors.secondary,
      secondaryContainer: CommonColors.secondary,

      //前景色
      surface: CommonColors.foregroundColor,
      error: CommonColors.hintErrorTextColor,

      //在primary位置的字的颜色
      onPrimary: CommonColors.onPrimaryTextColor,
      onSecondary: CommonColors.onPrimaryTextColor,
      onSurface: CommonColors.onSurfaceTextColor,
      onError: CommonColors.hintErrorTextColor,
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
      systemOverlayStyle:
          isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    ),

    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: CommonColors.secondary, width: 2),
      ),
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
      ),
    ),
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
        height: 1.3,
      ),
    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.normal),
      //showDatePicker里的date使用
      displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.normal),
      displaySmall: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.normal,
        height: 2,
      ),

      ///绿色标题
      headlineMedium: TextStyle(
        color: CommonColors.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      ///大标题  例如：showDatePicker里的month、year使用
      headlineSmall: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),

      ///段落标题  例如：AppBar.title和AlertDialog.title
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),

      ///次标题  例如：ListView 中ListTile.title
      titleMedium: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),

      ///小标题
      titleSmall: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal),

      ///默认
      bodyMedium: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),

      ///说明文字
      bodyLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),

      ///图表的标题栏
      bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),

      ///按钮
      labelLarge: TextStyle(
        color: CommonColors.onPrimaryTextColor,
        fontSize: 17.0,
        fontWeight: FontWeight.normal,
      ),

      labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal),
    ),
  );
}
