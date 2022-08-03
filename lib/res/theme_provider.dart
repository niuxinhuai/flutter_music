import 'package:flutter/material.dart';
import 'colors.dart';

class ThemeProvider extends ChangeNotifier {
  static const Map<ThemeMode, String> themes = {
    ThemeMode.dark: "Dark",
    ThemeMode.light: "Light"
  };

  ThemeMode? _themeMode;

  ThemeProvider() {
    syncTheme();
  }

  ThemeMode? get value => _themeMode;

  Future<void> syncTheme() async {
    var oldTheme = _themeMode;
    //默认给了一个日间
    _themeMode = ThemeMode.light;
    if (oldTheme != _themeMode) {
      CommonColors.refreshIsDark(_themeMode == ThemeMode.dark);
      notifyListeners();
    }
  }

  void _setTheme(ThemeMode themeMode) {
    this._themeMode = themeMode;
    CommonColors.refreshIsDark(_themeMode == ThemeMode.dark);
    notifyListeners();
  }

  void switchTheme() {
    if (_themeMode == ThemeMode.dark) {
      _setTheme(ThemeMode.light);
    } else {
      _setTheme(ThemeMode.dark);
    }
  }
}
