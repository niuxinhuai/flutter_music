import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtils {
  static const String _format1 = "yyyy-MM";

  static String getFormat1({int? time}) {
    return DateFormat(_format1).format(time == null
        ? DateTime.now()
        : DateTime.fromMillisecondsSinceEpoch(time));
  }

  ///秒转换分钟
  static String getMinuteFromMillSecond(int millSecond) {
    if (null == millSecond) return '00:00';

    double second = (millSecond / 1000);
    int minute = second % 3600 ~/ 60;
    int seconds = (second % 60).toInt();
    return TimeUtils.formatSecondTime(minute) +
        ':' +
        TimeUtils.formatSecondTime(seconds);
  }

  static String formatSecondTime(int s) {
    return s < 10 ? "0" + s.toString() : s.toString();
  }

  static String timeByString(int? mill) {
    if (mill == null) return "未知";
    if (isToday(mill)) return "今天";
    if (isYesterday(mill)) return "昨天";
    if (isTomorrow(mill)) return "明天";
    return "其他";
  }

  static bool isToday(int? mill) {
    if (mill == null) return false;
    return isTodayByDateTime(DateTime.fromMillisecondsSinceEpoch(mill));
  }

  static bool isYesterday(int? mill) {
    if (mill == null) return false;
    return isYesterdayDate(DateTime.fromMillisecondsSinceEpoch(mill));
  }

  static bool isTomorrow(int? mill) {
    if (mill == null) return false;
    return isTomorrowDate(DateTime.fromMillisecondsSinceEpoch(mill));
  }

  static bool isSameDay(int mill1, int mill2) {
    return DateUtils.isSameDay(DateTime.fromMillisecondsSinceEpoch(mill1),
        DateTime.fromMillisecondsSinceEpoch(mill2));
  }

  static bool isTodayByDateTime(DateTime date) {
    return DateUtils.isSameDay(DateTime.now(), date);
  }

  static bool isYesterdayDate(DateTime time) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    return yesterday.year == time.year &&
        yesterday.month == time.month &&
        yesterday.day == time.day;
  }

  static bool isTomorrowDate(DateTime time) {
    DateTime now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    return tomorrow.year == time.year &&
        tomorrow.month == time.month &&
        tomorrow.day == time.day;
  }

  static DateTime getDaysAgo(int days) {
    return DateTime.now().subtract(Duration(days: days));
  }

  static DateTime formatExpiresTime(String str) {
    var expiresTime =
        RegExp("Expires[^;]*;").stringMatch(str)!.split("=")[1].split(" ");
    var year = expiresTime[3];
    var day = expiresTime[1];
    var mounth = _getMounthByStr(expiresTime[2]);
    return DateTime(int.parse(year), mounth, int.parse(day));
  }

  static int _getMounthByStr(String str) {
    int output = 1;
    switch (str) {
      case "Jan":
        output = 1;
        break;
      case "Feb":
        output = 2;
        break;
      case "Mar":
        output = 3;
        break;
      case "Apr":
        output = 4;
        break;
      case "May":
        output = 5;
        break;
      case "Jun":
        output = 6;
        break;
      case "Jul":
        output = 7;
        break;
      case "Aug":
        output = 8;
        break;
      case "Sep":
        output = 9;
        break;
      case "Oct":
        output = 10;
        break;
      case "Nov":
        output = 11;
        break;
      case "Dec":
        output = 12;
        break;
    }
    return output;
  }
}
