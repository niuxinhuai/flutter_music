import 'package:flutter/material.dart';

class TimeUtils {
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
}
