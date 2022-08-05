import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/repository/share_preferences/sp.dart';
import 'package:flutter_music/utils/time_utl.dart';

class UserDefault {
  static String? username;
  static String? password;
  static String? cookie;
  static DateTime? cookieExpiresDateTime;
  static Map<String, String>? _headerMap;

  static bool clear() {
    username = null;
    password = null;
    cookie = null;
    cookieExpiresDateTime = null;
    _headerMap = null;
    SpUtil.logout();

    return true;
  }

  static bool isLogin() {
    return username?.isNotEmpty == true && password?.isNotEmpty == true;
  }

  static refresh() async {
    username = await getUsername();
    password = await getPassword();
    cookie = await getCookie();
    String? expires = await getCookieExpiresTime();
    if (expires?.isNotEmpty == true) {
      cookieExpiresDateTime = DateTime.parse(expires!);
      //提前3天请求cookie
      if (cookieExpiresDateTime!.isAfter(TimeUtils.getDaysAgo(3))) {
        Timer(Duration(milliseconds: 100), () {
          autoLogin();
        });
      }
    }
  }

  static void visitorLogin() async {
    print(">>>>>>>>点击le去登录");
    Response response = await CommonService.visitorLogin().catchError((e) {
      print(">>>>>>>>>>>>.e:$e");
    });
    print("data:${response.data.runtimeType}  >>:${response.data}");
    String cookie = "";
    DateTime? expires;
    response.headers.forEach((String name, List<String> values) {
      if (name == "set-cookie") {
        cookie = json
            .encode(values)
            .replaceAll("\[\"", "")
            .replaceAll("\"\]", "")
            .replaceAll("\",\"", "; ");
        try {
          expires = TimeUtils.formatExpiresTime(cookie);
        } catch (e) {
          expires = DateTime.now();
        }
      }
    });
    print(">>>>>>>>>>>>cookie:$cookie   expires:${expires!.toIso8601String()}");
    SpUtil.setCookie(cookie);
    SpUtil.setCookieExpires(expires!.toIso8601String());
    refresh();
  }

//  static void login() async {
//    Response response = await CommonService.login(username!, password!);
//    LoginWrap model = LoginWrap.fromJson(response.data);
//    if (model.errorCode == 0) {
//      SpUtil.setUserName(username!);
//      SpUtil.setPassword(password!);
//      String cookie = "";
//      DateTime? expires;
//      response.headers.forEach((String name, List<String> values) {
//        if (name == "set-cookie") {
//          cookie = json
//              .encode(values)
//              .replaceAll("\[\"", "")
//              .replaceAll("\"\]", "")
//              .replaceAll("\",\"", "; ");
//          try {
//            expires = TimeUtils.formatExpiresTime(cookie);
//          } catch (e) {
//            expires = DateTime.now();
//          }
//        }
//      });
//      SpUtil.setCookie(cookie);
//      SpUtil.setCookieExpires(expires!.toIso8601String());
//    }
//  }

  static void autoLogin() {
    if (isLogin()) {
//      login();
    }
  }

//  static Future<LoginWrap?> logout() async {
//    LoginWrap? response = await CommonService.logout();
//    return response;
//  }

  static Map<String, String>? getHeader() {
    print(">>>>>>>>>cookie:$cookie");
    if (null == _headerMap && cookie?.isNotEmpty == true) {
      _headerMap = Map();
      _headerMap!["Cookie"] = cookie!;
    }
    return _headerMap;
  }

  ///获取username
  static Future<String?> getUsername() {
    return SpUtil.getUserName();
  }

  ///获取password
  static Future<String?> getPassword() {
    return SpUtil.getPassword();
  }

  ///获取cookie
  static Future<String?> getCookie() {
    return SpUtil.getCookie();
  }

  ///获取cookie过期时间
  static Future<String?> getCookieExpiresTime() {
    return SpUtil.getCookieExpires();
  }
}
