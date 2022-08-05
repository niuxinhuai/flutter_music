import 'package:flutter_music/repository/share_preferences/sp.dart';
import 'package:flutter_music/utils/encrypt_util.dart';
import 'package:flutter_music/utils/string_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static Future<bool> hasKey(String key) {
    return getKeys().then((keys) => keys.contains(key));
  }

  static Future<Set<String>> getKeys() {
    return SharedPreferences.getInstance().then((sp) => sp.getKeys());
  }

  static Future<String?> getString(String key,
      {String defaultValue = ""}) async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getString(key);
    return StringUtils.isNullOrEmpty(value)
        ? defaultValue
        : EncrypterUtils.decrypt(value!);
  }

  static Future<bool> putString(String key, String value) {
    String obj = EncrypterUtils.encrypt(value);
    return SharedPreferences.getInstance().then((sp) => sp.setString(key, obj));
  }

  static Future<bool> getBool(String key, {bool defaultValue = false}) {
    return getString(key).then((value) =>
        StringUtils.isNullOrEmpty(value) ? defaultValue : (value == "true"));
  }

  static Future<bool> putBool(String key, bool value) {
    return putString(key, value ? "true" : "false");
  }

  static Future<int> getInt(String key, {int defaultValue = 0}) {
    return getString(key).then((value) =>
        StringUtils.isNullOrEmpty(value) ? defaultValue : int.parse(value!));
  }

  static Future<bool> putInt(String key, int? value) {
    return putString(key, value.toString());
  }

  static Future<double> getDouble(String key, {double defaultValue = 0}) {
    return getString(key).then((value) =>
        StringUtils.isNullOrEmpty(value) ? defaultValue : double.parse(value!));
  }

  static Future<bool> putDouble(String key, double value) {
    return putString(key, value.toString());
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return SharedPreferences.getInstance()
        .then((sp) => sp.setStringList(key, value));
  }

  static Future<List<String>> getStringList(String key) {
    return SharedPreferences.getInstance().then((sp) => sp.getStringList(key)!);
  }

  static Future<bool> remove(String key) {
    return SharedPreferences.getInstance().then((sp) => sp.remove(key));
  }

  static Future<bool> clear() {
    return SharedPreferences.getInstance().then((sp) {
      sp.getKeys().forEach((element) {
        if (!SpAppKey.allKey.contains(element)) {
          sp.remove(element);
        }
      });
      return true;
    });
    // return SharedPreferences.getInstance().then((sp) => sp.clear());
  }
}
