import 'package:flutter/material.dart';
import 'package:time_store/models/user/user.dart';
import 'package:time_store/utils/share-preference.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];

  User user;

  void addUser(String username, String email, String pass) {
    var newUser = User(userId: users.length + 1, username: username, email: email, password: pass, rePassword: pass);
    users.add(newUser);
    print(users);
    SharedPrefsService.setEmail(email);
    SharedPrefsService.setPassword(pass);
    notifyListeners();
  }
}
