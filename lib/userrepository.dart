import 'package:flutter/material.dart';
import 'package:major_project/usermode.dart';
class UserRepository {
  static List<User> users = [];
  Future<bool> loginUser(BuildContext context,String email, String password) async {
    var user = users.firstWhere(
            (user) => user.email == email && user.password == password,
        orElse: () => User(email: '', password: ''));

    return user.email.isNotEmpty;
  }
}
