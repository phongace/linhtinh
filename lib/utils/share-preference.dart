import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_store/config/theme.dart';

class SharedPrefsService {
  static setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  static setPassword(String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', pass);
  }

  static getEmail() async {
    var prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    if (email == null)
      return null;
    else
      return email;
  }

  static getPassword() async {
    var prefs = await SharedPreferences.getInstance();
    String pass = prefs.getString('password');
    if (pass == null)
      return null;
    else
      return pass;
  }

  static setToken(String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', str);
  }

  static getToken() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token == null)
      return null;
    else
      return token;
  }

  static removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  static void setThemeMode(AppTheme theme) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', AppTheme.values.indexOf(theme));
  }

  static Future<ThemeData> getThemeMode() async {
    var prefs = await SharedPreferences.getInstance();
    int preferredTheme = prefs.getInt('themeMode') ?? 1;
    ThemeData _themeData = appThemeData[AppTheme.values[preferredTheme]];
    return _themeData;
  }

  static void setBoolTheme(bool mode) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', mode);
  }

  static Future<bool> getBoolMode() async {
    var prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool('isDarkMode');
    if (boolValue == null) {
      return false;
    }
    return boolValue;
  }
}
