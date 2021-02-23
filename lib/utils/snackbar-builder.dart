import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:time_store/styles/component.dart';

abstract class SnackbarBuilder {
  static void showSnackbar(String content, Color color) {
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: CommonStyle.whiteColor,
      fontSize: 14,
    );
  }
}
