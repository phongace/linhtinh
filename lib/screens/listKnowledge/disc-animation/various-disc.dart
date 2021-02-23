import 'dart:math';
import 'package:flutter/material.dart';

class DiscData {
  static final _rd = Random();

  // final double size;
  // final Color color;
  // final Alignment alignment;

  Color color = Color.fromARGB(
    _rd.nextInt(200),
    _rd.nextInt(255),
    _rd.nextInt(255),
    _rd.nextInt(255),
  );
  double size = _rd.nextDouble() * 40 + 10;
  Alignment alignment = Alignment(
    _rd.nextDouble() * 2 - 1,
    _rd.nextDouble() * 2 - 1,
  );
}

class VariousDisc extends StatefulWidget {
  final int numberOfDisc;

  const VariousDisc({Key key, this.numberOfDisc = 50}) : super(key: key);

  @override
  _VariousDiscState createState() => _VariousDiscState();
}

class _VariousDiscState extends State<VariousDisc> {
  final _disc = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDisc();
  }

  void _makeDisc() {
    _disc.clear();
    for (var i = 0; i < widget.numberOfDisc; i++) {
      _disc.add(DiscData());
    }
    print(_disc.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: GestureDetector(
        onTap: () => setState(() {
          _makeDisc();
        }),
        child: Container(
          child: SizedBox.expand(
            child: Stack(
              children: [
                for (var disc in _disc)
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: disc.color,
                        shape: BoxShape.circle,
                      ),
                      height: disc.size,
                      width: disc.size,
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
