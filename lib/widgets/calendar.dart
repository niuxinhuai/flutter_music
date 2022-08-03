//import 'package:fish_redux/fish_redux.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_wanandroid/res/colors.dart';
//import 'package:flutter_wanandroid/res/other_theme.dart';
//import 'package:flutter_wanandroid/sections/calendar/models/calendar.dart';
//import 'package:flutter_wanandroid/utils/calendar_lunar_util.dart';
//import 'package:flutter_wanandroid/utils/calendar_util.dart';
//import 'package:flutter_wanandroid/utils/time_util.dart';
//import 'package:flutter_wanandroid/widget/card.dart';
//
//class GpCalendar extends StatefulWidget {
//  final DateTime? dateTime;
//  final double? width;
//  final DateTime? now;
//  final CalendarWrap? calendarWrap;
//
//  GpCalendar({this.dateTime, this.width, this.now, this.calendarWrap});
//
//  @override
//  _GpCalendarState createState() => _GpCalendarState();
//}
//
//class _GpCalendarState extends State<GpCalendar> {
//  int row = 7;
//  int column = 6;
//  List<List<Widget>> list = [];
//  DateTime? nowTime;
//  @override
//  void initState() {
//    super.initState();
//    nowTime = widget.dateTime;
//    if (widget.dateTime == null) {
//      nowTime = DateTime.now();
//    }
//    Future.delayed(Duration.zero, () {
//      //在这里处理页面
//      _reset();
//    });
//  }
//
//  void _reset() {
//    list.clear();
//    int weekday = CalendarUtil.getWeekday(widget.dateTime!);
//    int days = CalendarUtil.getDays(widget.dateTime!);
//    double width = widget.width!;
//    double itemWidth = width / row.toDouble();
//
//    int index = 0;
//    if (weekday == row) weekday = 0;
//    for (int i = 0; i < column; ++i) {
//      List<Widget> rowWidgets = [];
//      for (int j = 0; j < row; ++j) {
//        if (i == 0 && j == weekday) {
//          index += 1;
//        } else if (index != 0) {
//          index += 1;
//        }
//        if (index > days) {
//          index = -100;
//        }
//
//        bool canShow = (index >= 1 && index <= days);
//        Widget? cellWidget;
//
//        if (canShow) {
//          //时间
//          DateTime lunarTime = DateTime(nowTime!.year, nowTime!.month, index);
//          //状态
//          _CalendarState _calendarState = getState(lunarTime);
//          CalendarItem? holidayItem;
//          String format7 = TimeUtil.getFormat7(lunarTime);
//
//          if (widget.calendarWrap?.holiday != null &&
//              widget.calendarWrap!.holiday!.length != 0) {
//            if (widget.calendarWrap!.holiday!.containsKey(format7)) {
//              ///存在节假日的时间
//              holidayItem = widget.calendarWrap!.holiday![format7];
//            }
//          }
//          cellWidget = _CalendarCell(
//                  dateTime: lunarTime,
//                  holidayItem: holidayItem,
//                  calendarState: _calendarState,
//                  size: itemWidth)
//              .drawSelf(context);
//        }
//        Widget rowChildWidget = Container(
//          width: itemWidth,
//          height: itemWidth,
//          alignment: Alignment.center,
//          child: canShow ? cellWidget : null,
//        );
//        rowWidgets.add(rowChildWidget);
//      }
//      list.add(rowWidgets);
//    }
//    if (mounted) {
//      setState(() {});
//    }
//  }
//
//  _CalendarState getState(DateTime dateTime) {
//    _CalendarState state;
//    DateTime now = DateTime.now();
//    if (TimeUtil.isTodayByDateTime(dateTime)) {
//      state = _CalendarState.TODAY;
//    } else if (TimeUtil.isSameMonthButBeforDay(dateTime)) {
//      state = _CalendarState.CURRENT_MONTH_BEFORE_TODAY;
//    } else if (TimeUtil.isSameMonthButAfterDay(dateTime)) {
//      state = _CalendarState.CURRENT_MONTH_AFTER_TODAY;
//    } else if (dateTime.isBefore(now)) {
//      state = _CalendarState.PRE_MONTH_DAY;
//    } else {
//      state = _CalendarState.NEXT_MONTH_DAY;
//    }
//    return state;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (list.isEmpty) {
//      return Container(
//        width: 0,
//        height: 0,
//      );
//    }
//    ;
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: [
//        Container(
//          color: CommonColors.foregroundColor,
//          width: double.infinity,
//          padding: EdgeInsets.only(right: 30, top: 10, bottom: 10),
//          alignment: Alignment.centerRight,
//          child: Text(
//            '${widget.dateTime!.month}月',
//            style: GpOtherTheme.size20Green(context),
//          ),
//        ),
//        GpCard(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: list
//                .map((e) => Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: e.map((e) => e).toList(),
//                    ))
//                .toList(),
//          ),
//          width: double.infinity,
////          height: 300,
//        )
//      ],
//    );
//  }
//}
//
//class _CalendarCell {
//  final DateTime? dateTime;
//  final double? size;
//  final CalendarItem? holidayItem;
//  final _CalendarState? calendarState;
//
//  _CalendarCell(
//      {this.dateTime, this.holidayItem, this.calendarState, this.size});
//
//  Widget drawSelf(BuildContext? context) {
//    Tuple2 tuple2 = getCalendarCellTup();
//    String lunarStr = tuple2.i0;
//    Color detailColor = tuple2.i1;
//
//    Widget rowChildWidget = Container(
//      width: size,
//      height: size,
//      decoration: isToday()
//          ? BoxDecoration(
//              color: Colors.red,
//              borderRadius: BorderRadius.all(Radius.circular(size! / 2.0)))
//          : null,
//      alignment: Alignment.center,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Text(
//            "${dateTime!.day}",
//            style: GpOtherTheme.size17(context!)?.copyWith(
//                color: isToday()
//                    ? CommonColors.onPrimaryTextColor
//                    : CommonColors.onSurfaceTextColor,
//                fontSize: 19,
//                fontWeight: FontWeight.w500),
//          ),
//          Text(
//            lunarStr,
//            style: GpOtherTheme.size12(context)
//                ?.copyWith(fontSize: 10, color: detailColor),
//          )
//        ],
//      ),
//    );
//    return rowChildWidget;
//  }
//
//  bool isToday() {
//    if (calendarState == null) return false;
//    return calendarState == _CalendarState.TODAY;
//  }
//
//  Tuple2 getCalendarCellTup() {
//    String lunarStr = "";
//    int holidayState = 0;
//
//    LunarCalendar lunarCalendar = LunarCalendar(dateTime!);
//
//    lunarStr = LunarCalendar.getChinaDayString(lunarCalendar.day);
//    if (lunarStr == "初一") {
//      lunarStr = "${lunarCalendar.getChinaMonthString()}月";
//      holidayState = 3;
//    }
//
//    if (holidayItem != null) {
//      if (holidayItem!.holiday != null) {
//        if (holidayItem!.holiday == true) {
//          ///节假日
//          lunarStr = holidayItem!.name ?? lunarStr;
//          holidayState = 1;
//        } else {
//          ///调休
//          lunarStr = "补班";
//          holidayState = 2;
//        }
//      }
//    }
//
//    Color detailColor = CommonColors.textColor999;
//    if (holidayState == 1) {
//      detailColor = CommonColors.primary;
//    } else if (holidayState == 2) {
//      detailColor = Colors.red;
//    } else if (holidayState == 3) {
//      detailColor = Colors.red;
//    }
//    return Tuple2(lunarStr, detailColor);
//  }
//}
//
//enum _CalendarState {
//  TODAY, //今天
//  CURRENT_MONTH_BEFORE_TODAY, //当月，比今天早的日期
//  CURRENT_MONTH_AFTER_TODAY, //当月，比今天晚的日期
//  PRE_MONTH_DAY, //过去月份的日期
//  NEXT_MONTH_DAY, //下个月份的日期
//}
