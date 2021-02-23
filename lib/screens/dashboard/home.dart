import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_store/config/constant.dart';
import 'package:time_store/models/album/album.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_store/services/album-services.dart';
import 'package:time_store/styles/component.dart';
import 'package:time_store/utils/share-preference.dart';
import 'package:time_store/widgets/navigation-drawer.dart';
import 'package:time_store/widgets/product-row-tem.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int toggle = 0;

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<Album> list = [];
  int get count => list.length;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AnimationController _con;
  var _searchCtrl = TextEditingController();
  String _term = '';

  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Constant.isDarkMode = await SharedPrefsService.getBoolMode();
    });

    AlbumService.getAlbumInfo().then((value) {
      setState(() {
        list = value;
      });
    });
    _searchCtrl.addListener(onTextChanged);
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void onTextChanged() {
    setState(() {
      _term = _searchCtrl.text;
    });
    AlbumService.search(_term).then((result) {
      setState(() {
        list = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CommonStyle.whiteColor,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: Container(
                child: SvgPicture.asset('images/icon/ic_option.svg'),
                padding: const EdgeInsets.symmetric(vertical: 4),
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            buildSearch(),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 10),
            child: ClipOval(
              child: Image.asset(
                'images/avatar.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: buildListItem(),
          )
        ],
      ),
    );
  }

  Widget buildListItem() {
    return Container(
      child: ListView.separated(
        itemCount: count,
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 1,
          color: Colors.blueGrey,
          indent: 15.0,
          endIndent: 15.0,
        ),
        itemBuilder: (context, index) {
          Album album = list[index];
          return AlbumItem(album);
        },
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      color: CommonStyle.whiteColor,
      child: Center(
        child: Container(
          height: 100.0,
          width: 260.0,
          alignment: Alignment(-1.0, 0.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 375),
            height: 48.0,
            width: (toggle == 0) ? 48.0 : 260.0,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: -10.0,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 375),
                  top: 6.0,
                  right: 7.0,
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: AnimatedBuilder(
                        child: Icon(
                          Icons.mic,
                          size: 20.0,
                        ),
                        builder: (context, widget) {
                          return Transform.rotate(
                            angle: _con.value * 2.0 * pi,
                            child: widget,
                          );
                        },
                        animation: _con,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 375),
                  left: (toggle == 0) ? 20.0 : 40.0,
                  curve: Curves.easeOut,
                  top: 11.0,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      height: 23.0,
                      width: 180.0,
                      child: TextFormField(
                        controller: _searchCtrl,
                        cursorRadius: Radius.circular(10.0),
                        cursorWidth: 2.0,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Tìm kiếm...',
                          labelStyle: TextStyle(
                            color: Color(0xff5B5B5B),
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(30.0),
                  child: IconButton(
                    splashRadius: 19.0,
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(
                        () {
                          if (toggle == 0) {
                            toggle = 1;
                            _con.forward();
                          } else {
                            toggle = 0;
                            _searchCtrl.clear();
                            _con.reverse();
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
