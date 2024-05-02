import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginData {
  GlobalKey<FormState>? formKey;
  String? username;
  String? password;

  LoginData({this.formKey, this.username, this.password});
}

class LoginFormStore extends LoginData {
  void setUsername(String username) {
    this.username = username;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setFormKey(GlobalKey<FormState> formKey) {
    this.formKey = formKey;
  }
}

final loginFormProvider = Provider<LoginFormStore>((ref) {
  return LoginFormStore();
});
