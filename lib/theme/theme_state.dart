import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/theme/utils.dart';

enum ThemeStateEnum { light, dark, amoled }

class ThemeState extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  ThemeData _themeData = kLightTheme;

  ThemeData get themeData => _themeData;
  set themeData(ThemeData val) {
    _themeData = val;
    notifyListeners();
  }

  ThemeState() {
    _initSharedPrefs();
  }

  _initSharedPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    ThemeStateEnum val = _getOption();
    _switchTheme(val);
  }

  void _switchTheme(ThemeStateEnum selected) {
    switch (selected) {
      case ThemeStateEnum.light:
        themeData = kLightTheme;
        break;
      case ThemeStateEnum.dark:
        themeData = kDarkTheme;
        break;
      case ThemeStateEnum.amoled:
        themeData = kAmoledTheme;
        break;
    }
  }

  void saveOptionValue(ThemeStateEnum optionValue) {
    _switchTheme(optionValue);
    _sharedPreferences?.setInt('theme_option', optionValue.index);
  }

  ThemeStateEnum _getOption() {
    int option = _sharedPreferences?.get('theme_option') as int? ?? 1;
    return ThemeStateEnum.values[option];
  }
}
