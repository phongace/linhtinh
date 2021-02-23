import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
        centerTitle: true,
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
              children: [
                TextSpan(
                  text: 'Alo alo 1 2 3 4 dmm cc ne` hellu hello. ' * 2,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: 'Vl chua vai lon luon dau cat moi',
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(
                  text: 'Alo alo 1 2 3 4 dmm cc ne` hellu hello. ',
                ),
              ]),
        ),
      ),
    );
  }
}
