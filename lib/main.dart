import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_store/providers/album-provider.dart';
import 'package:time_store/providers/theme-provider.dart';
import 'package:time_store/providers/token-provider.dart';
import 'package:time_store/providers/user-provider.dart';
import 'package:time_store/router/router.dart';
import 'package:time_store/screens/splash/splash-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlbumProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TokenProvider()),
        ChangeNotifierProvider(create: (context) => ThemeManager())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (_, model, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          theme: model.themeData,
          routes: RoutesConstant.routes,
        );
      },
    );
  }
}
