import 'package:flutter/material.dart';
import 'package:time_store/router/routing-name.dart';
import 'package:time_store/screens/authenticate/forgot-password.dart';
import 'package:time_store/screens/authenticate/login.dart';
import 'package:time_store/screens/authenticate/register.dart';
import 'package:time_store/screens/layout/main.dart';
import 'package:time_store/screens/listKnowledge/custom-drawer/custom-drawer.dart';
import 'package:time_store/screens/listKnowledge/custom-paint/custom-paint.dart';
import 'package:time_store/screens/listKnowledge/custom-path/custom-path.dart';
import 'package:time_store/screens/listKnowledge/disc-animation/various-disc.dart';
import 'package:time_store/screens/listKnowledge/transform/transform.dart';
import 'package:time_store/screens/listKnowledge/upload-image/upload-image.dart';

abstract class RoutesConstant {
  static final routes = <String, WidgetBuilder>{
    RoutingNameConstant.LoginScreen: (BuildContext context) => new LoginScreen(),
    RoutingNameConstant.ForgotPassword: (BuildContext context) => new ForgotPassword(),
    RoutingNameConstant.Register: (BuildContext context) => new RegisterScreen(),
    RoutingNameConstant.HomeRoute: (BuildContext context) => new DashboardHomePage(),
    RoutingNameConstant.TransformWidget: (BuildContext context) => new TransformWidget(),
    RoutingNameConstant.CustomDrawer: (BuildContext context) => new CustomDrawer(),
    RoutingNameConstant.UploadImage: (BuildContext context) => new UploadImage(),
    RoutingNameConstant.CustomPaint: (BuildContext context) => new CustomPaintt(),
    RoutingNameConstant.CustomPath: (BuildContext context) => new CustomPath(),
    RoutingNameConstant.AnimationDisc: (BuildContext context) => new VariousDisc(),
  };
}
