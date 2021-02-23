import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:time_store/router/routing-name.dart';
import 'package:time_store/styles/component.dart';

class ListKnowledge extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CommonStyle.whiteColor,
        elevation: 0,
        title: IconButton(
          icon: Container(
            child: SvgPicture.asset('images/icon/ic_option.svg'),
            padding: const EdgeInsets.symmetric(vertical: 4),
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            _button(
              'Transform Widget',
              Icon(
                FontAwesomeIcons.layerGroup,
                color: Theme.of(context).iconTheme.color,
              ),
              () => Navigator.pushNamed(context, RoutingNameConstant.TransformWidget),
            ),
            SizedBox(height: 10),
            _button(
              'Custom Drawer',
              Icon(
                FontAwesomeIcons.drawPolygon,
                color: Theme.of(context).iconTheme.color,
              ),
              () => Navigator.pushNamed(context, RoutingNameConstant.CustomDrawer),
            ),
            SizedBox(height: 10),
            _button(
              'Upload Image',
              Icon(
                FontAwesomeIcons.fileImage,
                color: Theme.of(context).iconTheme.color,
              ),
              () => Navigator.pushNamed(context, RoutingNameConstant.UploadImage),
            ),
            SizedBox(height: 10),
            _button(
              'Custom Paint',
              Icon(
                FontAwesomeIcons.artstation,
                color: Theme.of(context).iconTheme.color,
              ),
              () => Navigator.pushNamed(context, RoutingNameConstant.CustomPaint),
            ),
            SizedBox(height: 10),
            _button(
              'Custom Path',
              Icon(
                FontAwesomeIcons.dribbble,
                color: Theme.of(context).iconTheme.color,
              ),
              () => Navigator.pushNamed(context, RoutingNameConstant.CustomPath),
            ),
            _button(
              'Animation Disc',
              Icon(
                FontAwesomeIcons.mugHot,
                color: Theme.of(context).iconTheme.color,
              ),
              () => Navigator.pushNamed(context, RoutingNameConstant.AnimationDisc),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String label, Icon icon, Function func) {
    return FlatButton.icon(
      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      height: 42,
      minWidth: double.infinity,
      color: CommonStyle.whiteColor,
      icon: icon,
      label: Row(
        children: [
          SizedBox(width: 15.0),
          Text(label, style: TextStyle(color: Colors.blue[200])),
        ],
      ),
      onPressed: func,
    );
  }
}
