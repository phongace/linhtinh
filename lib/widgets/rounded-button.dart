import 'package:flutter/material.dart';
import 'package:time_store/styles/component.dart';

class RoundedButton extends StatelessWidget {
  final String text;

  final Function onPress;

  const RoundedButton({@required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.blue[800],
      ),
      child: FlatButton(
        child: Text(text, style: CommonStyle.defaultText(context, color: CommonStyle.whiteColor)),
        onPressed: onPress,
      ),
    );
  }
}
