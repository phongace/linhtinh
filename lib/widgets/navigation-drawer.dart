import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:time_store/config/constant.dart';
import 'package:time_store/providers/theme-provider.dart';
import 'package:time_store/providers/token-provider.dart';
import 'package:time_store/styles/component.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDStaterawer createState() => _NavigationDStaterawer();
}

class _NavigationDStaterawer extends State<NavigationDrawer> {
  var user = FirebaseAuth.instance.currentUser;
  bool isSwitch = true;

  @override
  void initState() {
    super.initState();
    isSwitch = Constant.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 35,
                    backgroundImage: NetworkImage(user.photoURL),
                  ),
                  SizedBox(height: 10),
                  Text(user.displayName, style: CommonStyle.defaultText(context, textSize: 16)),
                  SizedBox(height: 5),
                  Text(user.email, style: CommonStyle.defaultText(context, color: Colors.blueGrey[600])),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent[100],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                LiteRollingSwitch(
                  value: isSwitch,
                  animationDuration: const Duration(milliseconds: 400),
                  colorOn: Colors.blueGrey,
                  colorOff: Colors.grey,
                  iconOn: Icons.nightlight_round,
                  iconOff: Icons.power_settings_new,
                  onChanged: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        isSwitch = value;
                      });
                      Constant.isDarkMode = value;
                      context.read<ThemeManager>().toggleMode(isSwitch);
                      // Provider.of<ThemeManager>(context, listen: false).toggleMode(isSwitch);
                    });
                  },
                ),
                const SizedBox(width: 18.0),
                Text(
                  'Dark Mode',
                  style: CommonStyle.boldText(context, textSize: 15),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Đăng xuất'),
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
    Provider.of<TokenProvider>(context, listen: false).removeToken();
    bool isLogged = await Provider.of<TokenProvider>(context, listen: false).getToken();
    if (!isLogged) {
      Navigator.pushNamed(context, '/login');
    } else
      return;
  }
}
