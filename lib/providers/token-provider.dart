import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_store/utils/share-preference.dart';

class TokenProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  String get token => _token;

  String _token;

  bool get isLogged => _isLogged;

  bool _isLogged = false;

  Future login() async {
    final user = await googleSignIn.signIn();
    if (user == null) {
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await SharedPrefsService.setToken(googleAuth.accessToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  void setToken(String str) {
    SharedPrefsService.setToken(str);

    _isLogged = true;
    notifyListeners();
  }

  Future<bool> getToken() async {
    _token = await SharedPrefsService.getToken();
    if (_token != null && _token != '') {
      _isLogged = true;
    }
    notifyListeners();
    return _isLogged;
  }

  void removeToken() {
    SharedPrefsService.removeToken();
    _isLogged = false;
    notifyListeners();
  }
}
