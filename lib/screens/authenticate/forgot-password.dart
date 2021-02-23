import 'package:flutter/material.dart';
import 'package:time_store/styles/component.dart';
import 'package:time_store/widgets/background-image.dart';
import 'package:time_store/widgets/base-input.dart';
import 'package:time_store/widgets/rounded-button.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BgImage(image: 'images/login_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Quên mật khẩu',
                style: CommonStyle.defaultText(context, textSize: 20, color: CommonStyle.whiteColor)),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.12),
                Container(
                  width: size.width * 0.8,
                  child: Text(
                    'Nhập email của bạn, chúng tôi sẽ nhắn mã cài đặt lại mật khẩu',
                    style: CommonStyle.defaultText(context),
                  ),
                ),
                SizedBox(height: 20),
                BaseTextInput(
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30),
                RoundedButton(text: 'Gửi')
              ],
            ),
          ),
        )
      ],
    );
  }
}
