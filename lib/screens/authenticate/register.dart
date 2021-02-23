import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_store/providers/user-provider.dart';
import 'package:time_store/styles/component.dart';
import 'package:time_store/utils/snackbar-builder.dart';
import 'package:time_store/widgets/background-image.dart';
import 'package:time_store/widgets/base-input.dart';
import 'package:time_store/widgets/loading.dart';
import 'package:time_store/widgets/rounded-button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _username = TextEditingController();
  var _email = TextEditingController();
  var _pass = TextEditingController();
  var _rePass = TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Stack(
            children: [
              BgImage(image: 'images/register_bg.png'),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'Đăng ký',
                    style: CommonStyle.defaultText(context, textSize: 20),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Container(
                        width: size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.12),
                            BaseTextInput(
                              textCtrl: _username,
                              hint: 'Tên người dùng',
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Tên người dùng không được để trống!";
                                } else {
                                  return null;
                                }
                              },
                              onChangeText: (String name) {
                                name = _username.text;
                              },
                            ),
                            SizedBox(height: 20),
                            BaseTextInput(
                              textCtrl: _email,
                              hint: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Email không được để trống!";
                                } else {
                                  return null;
                                }
                              },
                              onChangeText: (String email) {
                                email = _email.text;
                              },
                            ),
                            SizedBox(height: 20),
                            BaseTextInput(
                              textCtrl: _pass,
                              obscureText: true,
                              hint: 'Mật khẩu',
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Mật khẩu không được để trống!";
                                } else {
                                  return null;
                                }
                              },
                              onChangeText: (String pass) {
                                pass = _pass.text;
                              },
                            ),
                            SizedBox(height: 20),
                            BaseTextInput(
                              textCtrl: _rePass,
                              obscureText: true,
                              hint: 'Nhập lại mật khẩu',
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Mật khẩu không được để trống!";
                                } else if (value != _pass.text) {
                                  return "Nhập lại mật khẩu chưa đúng!";
                                } else {
                                  return null;
                                }
                              },
                              onChangeText: (String rePass) {
                                rePass = _rePass.text;
                              },
                            ),
                            SizedBox(height: 35),
                            RoundedButton(
                              text: 'Đăng ký',
                              onPress: () => _registerHandle(context),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Bạn đã có tài khoản?', style: CommonStyle.defaultText(context)),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, '/login'),
                                  child: Text('Đăng nhập', style: CommonStyle.defaultText(context, color: Colors.blue)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
  }

  void _registerHandle(BuildContext context) {
    if (_formKey.currentState.validate()) {
      final users = Provider.of<UserProvider>(context, listen: false);
      users.addUser(_username.text, _email.text, _pass.text);
      SnackbarBuilder.showSnackbar('Đăng ký thành công', Colors.blue[500]);
      Navigator.pop(context);
      setState(() {
        loading = true;
      });
      return;
    } else {
      setState(() {
        loading = false;
      });
      return;
    }
  }
}
