import 'package:flutter/material.dart';
import 'package:time_store/config/theme.dart';
import 'package:time_store/utils/share-preference.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData _themeData;

  ThemeManager() {
    _loadTheme();
  }

  ThemeData get themeData {
    if (_themeData == null) {
      _themeData = ThemeData.dark();
    }
    return _themeData;
  }

  setTheme(AppTheme theme) {
    _themeData = appThemeData[theme];

    SharedPrefsService.setThemeMode(theme);
    notifyListeners();
  }

  void _loadTheme() async {
    _themeData = await SharedPrefsService.getThemeMode();
    notifyListeners();
  }

  void toggleMode(bool mode) async {
    SharedPrefsService.setBoolTheme(mode);
    mode ? setTheme(AppTheme.Dark) : setTheme(AppTheme.Light);
    notifyListeners();
  }
}
