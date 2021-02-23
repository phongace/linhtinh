import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    scaffoldBackgroundColor: Color(0xffF9FCF4),
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  ),
  AppTheme.Dark: ThemeData(
    scaffoldBackgroundColor: Color(0xff022640),
    colorScheme: ColorScheme.dark(),
    primaryColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  ),
};
