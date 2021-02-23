import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_store/providers/token-provider.dart';
import 'package:time_store/router/routing-name.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _loadNextScreen());
  }

  _loadNextScreen() async {
    bool isLogged = await Provider.of<TokenProvider>(context, listen: false).getToken();
    print('is logged: ' + isLogged.toString());
    if (!isLogged) {
      await Future.delayed(const Duration(milliseconds: 1500));
      Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.LoginScreen, (Route<dynamic> route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.HomeRoute, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'images/splash_background.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
