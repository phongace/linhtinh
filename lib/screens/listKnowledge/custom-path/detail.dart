import 'package:flutter/material.dart';

class DetailCustomPath extends StatefulWidget {
  @override
  _DetailCustomPathState createState() => _DetailCustomPathState();
}

class _DetailCustomPathState extends State<DetailCustomPath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrangeAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Positioned(
            top: 44,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                size: 28,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
