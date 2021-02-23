import 'package:flutter/material.dart';
import 'package:time_store/screens/listKnowledge/custom-path/detail.dart';

class CustomPath extends StatefulWidget {
  @override
  _CustomPathState createState() => _CustomPathState();
}

class _CustomPathState extends State<CustomPath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Path'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ClipPath(
                clipper: TicketContainer(),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 450,
                  color: Colors.blue[100],
                ),
              ),
              const SizedBox(height: 30),
              ClipPath(
                clipper: TicketClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 365,
                  color: Colors.blue[100],
                ),
              ),
              ClipPath(
                clipper: BackgroundClipper(),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (context, _, __) => DetailCustomPath()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.deepOrangeAccent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final int numberOfSmallClips;

  const TicketClipper({this.numberOfSmallClips});

  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    var clipRadius = 12.5;
    var path = Path();
    final clipPath = Path();

    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, w, h),
      Radius.circular(10.0),
    ));

    clipPath.addOval(Rect.fromCircle(
      center: Offset(0, h * 0.3 + clipRadius),
      radius: clipRadius,
    ));

    clipPath.addOval(Rect.fromCircle(
      center: Offset(w, h * 0.3 + clipRadius),
      radius: clipRadius,
    ));

    return path;
  }

  @override
  bool shouldReclip(TicketClipper old) => old.numberOfSmallClips != numberOfSmallClips;
}

class TicketContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;

    var path = Path();

    path.lineTo(w - 25, 0);
    path.quadraticBezierTo(w, 0, w, 25);
    path.lineTo(w, h * 0.3);
    path.quadraticBezierTo(w - 30, h * 0.35, w, h * 0.4);
    path.lineTo(w, h - 25);
    path.quadraticBezierTo(w, h, w - 25, h);
    path.lineTo(25, h);
    path.quadraticBezierTo(0, h, 0, h - 25);
    path.lineTo(0, h * 0.4);
    path.quadraticBezierTo(30, h * 0.35, 0, h * 0.3);
    path.lineTo(0, 25);
    path.quadraticBezierTo(0, 0, 25, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;

    var path = Path();

    path.moveTo(0, h * 0.33);
    path.lineTo(0, h - 50);
    path.quadraticBezierTo(0, h, 50, h);
    path.cubicTo(100, h - 120, w - 100, h, w - 50, h);
    path.lineTo(w - 50, h);
    path.quadraticBezierTo(w, h, w, h - 50);
    path.lineTo(w, 100);
    path.quadraticBezierTo(w - 10, 0, w - 150, 100);
    path.lineTo(100, 150);
    path.quadraticBezierTo(0, h * 0.41, 0, h * 0.52);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
