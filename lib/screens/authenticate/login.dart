import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:time_store/providers/token-provider.dart';
import 'package:time_store/router/routing-name.dart';
import 'package:time_store/styles/component.dart';
import 'package:time_store/utils/share-preference.dart';
import 'package:time_store/utils/snackbar-builder.dart';
import 'package:time_store/widgets/background-image.dart';
import 'package:time_store/widgets/base-input.dart';
import 'package:time_store/widgets/loading.dart';
import 'package:time_store/widgets/rounded-button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _email = TextEditingController();
  var _password = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Stack(
            children: [
              BgImage(image: 'images/login_bg.png'),
              Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.transparent,
                body: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Flexible(
                        child: Center(
                          child: Text(
                            'Timestore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 58,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      BaseTextInput(
                        hint: 'Email',
                        textCtrl: _email,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val.isEmpty ? "Email không được để trống!" : null,
                      ),
                      SizedBox(height: 15),
                      BaseTextInput(
                        hint: 'Mật khẩu',
                        textCtrl: _password,
                        obscureText: true,
                        validator: (val) => val.isEmpty ? "Mật khẩu không được để trống!" : null,
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: size.width * 0.8,
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/forgot'),
                          child: Text('Quên mật khẩu', style: CommonStyle.defaultText(context)),
                        ),
                      ),
                      SizedBox(height: 25),
                      RoundedButton(
                        text: 'Login',
                        onPress: () => login(context),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.red[800],
                        ),
                        child: FlatButton.icon(
                          icon: Icon(
                            FontAwesomeIcons.google,
                            color: CommonStyle.whiteColor,
                          ),
                          label: Text('Đăng nhập bằng Google',
                              style: CommonStyle.defaultText(context, color: CommonStyle.whiteColor)),
                          onPressed: () => loginGoogle(context),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: Text('Tạo tài khoản mới', style: CommonStyle.defaultText(context)),
                      ),
                      SizedBox(height: 50)
                    ],
                  ),
                ),
              )
            ],
          );
  }

  void loginGoogle(BuildContext context) async {
    await Provider.of<TokenProvider>(context, listen: false).login();
    bool isLogged = await Provider.of<TokenProvider>(context, listen: false).getToken();
    if (isLogged) {
      Navigator.pushNamed(context, RoutingNameConstant.HomeRoute);
    } else
      return;
  }

  void login(BuildContext context) async {
    String email = await SharedPrefsService.getEmail();
    String password = await SharedPrefsService.getPassword();

    // dismiss keyboard on button click
    FocusManager.instance.primaryFocus.unfocus();
    if (_formKey.currentState.validate()) {
      if (_email.text == email && _password.text == password) {
        SnackbarBuilder.showSnackbar('Đăng nhập thành công', Colors.blue[500]);
        Navigator.pushNamed(context, RoutingNameConstant.HomeRoute);
      } else if (_email.text != email) {
        SnackbarBuilder.showSnackbar('Tài khoản không tồn tại', Colors.red);
      } else if (_password.text != password) {
        SnackbarBuilder.showSnackbar('Sai mật khẩu', Colors.red);
      } else {
        SnackbarBuilder.showSnackbar('Đăng nhập thất bại', Colors.red);
      }
      setState(() {
        loading = true;
      });
    } else
      setState(() {
        loading = true;
      });
    return;
  }
}
