import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class GifAnimation extends StatefulWidget {
  @override
  _GifAnimationState createState() => _GifAnimationState();
}

class _GifAnimationState extends State<GifAnimation> with TickerProviderStateMixin {
  GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new GifController(vsync: this);
    _controller.repeat(min: 0, max: 86, period: Duration(milliseconds: 10000));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: GifImage(
        controller: _controller,
        // image: Image.network('https://i.pinimg.com/originals/2b/3a/97/2b3a97a79c3cb74ff7533d05c73c6bb4.gif').image,
        image: Image.network(
                'https://media4.giphy.com/media/QLXRKFxhSbcWs/giphy.gif?cid=ecf05e478u4bxjfwudh8a1pm6xcgttdxo82q1bz41cuopelr&rid=giphy.gif')
            .image,
      ),
    );
  }
}
