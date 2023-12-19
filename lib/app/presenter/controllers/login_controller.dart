import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      password: map['password'],
    );
  }
}

class LoginController extends ChangeNotifier {
  late User _user;
  User get user => _user;

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  String? validateFields(String email, String password) {
    if (email.isEmpty) {
      return 'Preencha seu email';
    }

    if (email.trim() != email) {
      return 'O e-mail não pode terminar com espaços';
    }

    if (!email.contains('@')) {
      return 'Insira um e-mail válido por favor';
    }

    if (password.isEmpty) {
      return 'Preencha a senha';
    }

    if (password.length <= 2) {
      return 'O campo senha não pode ter menos que dois caracteres';
    }

    if (password.trim() != password) {
      return 'A senha não pode terminar com espaços';
    }

    return null;
  }

  Future<String?> validateLogin(String email, String password) async {
    String? fieldsError = validateFields(email, password);

    if (fieldsError != null) {
      return fieldsError;
    }

    return null;
  }

  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = _user.toMap();
    String encodedUser = jsonEncode(userMap);
    prefs.setString('user', encodedUser);
  }

  void clearUser(context) {
    _user = User(email: '', password: '');
    saveUser();
    Navigator.pushReplacementNamed(context, '/login');
    notifyListeners();
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedUser = prefs.getString('user');
    if (encodedUser != null) {
      Map<String, dynamic> userMap = jsonDecode(encodedUser);
      _user = User.fromMap(userMap);
      notifyListeners();
    }
  }

  void userLogged(loginController, context) async {
    await loginController.loadUser();

    if (loginController.user.email.isNotEmpty &&
        loginController.user.password.isNotEmpty) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
