import 'package:flutter/material.dart';
import 'package:time_store/styles/component.dart';

class BaseTextInput extends StatelessWidget {
  final TextEditingController textCtrl;
  final Function(String) onChangeText;
  final String hint;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;

  const BaseTextInput(
      {Key key,
      this.textCtrl,
      this.onChangeText,
      this.hint,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: TextFormField(
        controller: textCtrl,
        decoration: new InputDecoration(
          hintText: hint,
          fillColor: Colors.grey[500].withOpacity(0.5),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 20),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          errorStyle: TextStyle(fontSize: 14.0),
          hintStyle: CommonStyle.defaultText(context, color: CommonStyle.whiteColor),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
              width: 1.0,
            ),
          ),
        ),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: (value) => onChangeText(value),
      ),
    );
  }
}
