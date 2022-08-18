import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_music/models/simple_model.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/repository/share_preferences/sp.dart';
import 'package:flutter_music/sections/login/models/login.dart';
import 'package:flutter_music/utils/time_utl.dart';
import 'package:flutter_music/widgets/toast.dart';

class UserDefault {
  static String? username;
  static String? email;
  static String? password;
  static String? cookie;
  static String? token;
  static DateTime? cookieExpiresDateTime;
  static Map<String, String>? _headerMap;

  static bool clear() {
    email = null;
    username = null;
    password = null;
    cookie = null;
    cookieExpiresDateTime = null;
    _headerMap = null;
    token = null;
    SpUtil.logout();

    return true;
  }

  static bool isLogin() {
    return token?.isNotEmpty == true;
  }

  static refresh() async {
    username = await getUsername();
    email = await getEmail();
    token = await getToken();
    password = await getPassword();
    cookie = await getCookie();
    String? expires = await getCookieExpiresTime();
    if (expires?.isNotEmpty == true) {
      cookieExpiresDateTime = DateTime.parse(expires!);
      //提前3天请求cookie
      if (cookieExpiresDateTime!.isAfter(TimeUtils.getDaysAgo(3))) {
        Timer(Duration(milliseconds: 100), () {
//          refreshLoginState();
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

  static Future<EmailLoginMode> emailLogin(
      String email, String password) async {
    EmailLoginMode loginMode =
        await CommonService.emailLogin(email, password).catchError((e) {
      print(">>>>>>>>>>>>.e:$e");
    });

    if (loginMode.code == 200) {
      SpUtil.setEmail(email);
      SpUtil.setPassword(password);
      SpUtil.setToken(loginMode.token!);
      SpUtil.setUserName(loginMode.account?.userName ?? "");
      String cookie = loginMode.cookie!;
      DateTime? expires;
      try {
        expires = TimeUtils.formatExpiresTime(cookie);
      } catch (e) {
        expires = DateTime.now();
      }
      SpUtil.setCookie(cookie);
      SpUtil.setCookieExpires(expires.toIso8601String());
      refresh();
    } else {
      print(">>>>>>>>>>>>登录出错");
    }

    return loginMode;
  }

  static void refreshLogin() async {
    EmailLoginMode loginMode = await CommonService.refreshLogin();
    if (loginMode.code == 200) {
      String cookie = loginMode.cookie!;
      DateTime? expires;
      try {
        expires = TimeUtils.formatExpiresTime(cookie);
      } catch (e) {
        expires = DateTime.now();
      }

      SpUtil.setCookie(cookie);
      SpUtil.setCookieExpires(expires.toIso8601String());
    }
  }

  static void refreshLoginState() {
    if (isLogin()) {
      refreshLogin();
    }
  }

//  static Future<LoginWrap?> logout() async {
//    LoginWrap? response = await CommonService.logout();
//    return response;
//  }

  static Map<String, String>? getHeader() {
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

  ///获取email
  static Future<String?> getEmail() {
    return SpUtil.getEmail();
  }

  ///获取token
  static Future<String?> getToken() {
    return SpUtil.getToken();
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
