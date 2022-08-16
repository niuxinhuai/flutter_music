import 'dart:convert';

import 'package:flutter_music/constants/key.dart';
import 'package:flutter_music/helper/sp_helper.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';

class SpAppKey {
  static const String _one = "one";
  static const String _cookie = "cookie";
  static const String _expires = "expires";
  static const String _username = "username";
  static const String _password = "password";
  static const String _squareData = "square_data";
  static const String _token = "token";
  static const String _email = "email";
  static const String _square_highquality_tag = "highquality_tag";

  static const List<String> allKey = [
    _one,
    _cookie,
    _expires,
    _username,
    _password,
    _squareData,
    _token,
    _email,
    _square_highquality_tag,
  ];
}

class SpUtil {
  static Future<bool> setCookie(String value) {
    return SpHelper.putString(SpAppKey._cookie, value);
  }

  static Future<bool> setCookieExpires(String value) {
    return SpHelper.putString(SpAppKey._expires, value);
  }

  static Future<bool> setUserName(String value) {
    return SpHelper.putString(SpAppKey._username, value);
  }

  static Future<bool> setPassword(String value) {
    return SpHelper.putString(SpAppKey._password, value);
  }

  static Future<bool> setEmail(String value) {
    return SpHelper.putString(SpAppKey._email, value);
  }

  static Future<bool> setToken(String value) {
    return SpHelper.putString(SpAppKey._token, value);
  }

  static Future<bool> setSquareTag(String value) {
    return SpHelper.putString(SpAppKey._square_highquality_tag, value);
  }

  static Future<String?> getToken() {
    return SpHelper.getString(SpAppKey._token);
  }

  static Future<String?> getEmail() {
    return SpHelper.getString(SpAppKey._email);
  }

  static Future<String?> getCookie() {
    return SpHelper.getString(SpAppKey._cookie);
  }

  static Future<String?> getCookieExpires() {
    return SpHelper.getString(SpAppKey._expires);
  }

  static Future<String?> getUserName() {
    return SpHelper.getString(SpAppKey._username);
  }

  static Future<String?> getPassword() {
    return SpHelper.getString(SpAppKey._password);
  }

  static Future<String?> getSquareTag() async {
    String? tagStr = await SpHelper.getString(SpAppKey._square_highquality_tag);
    if (tagStr == null || tagStr.isEmpty == true) {
      return ConstantsKey.square_tag;
    }
    return tagStr;
  }

  ///存储用户歌单广场的数据
  static Future<bool> setUserSquareSource(List<CatlistSubItem> items) async {
    List<String> value = items.map((e) => jsonEncode(e.toJson())).toList();
    return SpHelper.setStringList(SpAppKey._squareData, value);
  }

  ///获取用户歌单广场的数据
  static Future<List<CatlistSubItem>?> getUserSquareSource() async {
    List<String> list = await SpHelper.getStringList(SpAppKey._squareData);
    if (list.isNotEmpty == true) {
      return list.map((e) => CatlistSubItem.fromJson(jsonDecode(e))).toList();
    }
    return null;
  }

  static Future<bool> logout() async {
    await SpHelper.remove(SpAppKey._username);
    await SpHelper.remove(SpAppKey._password);
    return true;
  }
}
