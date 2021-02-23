import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:time_store/screens/dashboard/home.dart';
import 'package:time_store/screens/listKnowledge/list.dart';
import 'package:time_store/screens/notification/notification.dart';
import 'package:time_store/screens/text/text.dart';
import 'package:time_store/styles/component.dart';
import 'package:time_store/widgets/gif-animation.dart';

class DashboardHomePage extends StatefulWidget {
  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          HomeScreen(),
          NotificationPage(),
          TextWidget(),
          ListKnowledge(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.home),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(0);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.bell),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(1);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.smile),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(2);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.list),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(3);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => _showGifDialog(),
            child: Icon(Icons.add, color: CommonStyle.whiteColor),
          ),
        ),
      ),
    );
  }

  Future<void> _showGifDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return GifAnimation();
      },
    );
  }
}
