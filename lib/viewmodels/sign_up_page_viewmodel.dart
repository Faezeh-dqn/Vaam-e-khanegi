import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/auth_service.dart';
import 'package:vaam_khanegi/views/sign_in.dart';

class SignUpPageViewModel extends BaseViewModel {
  final AuthService authService;
  String _name;
  String _email;
  String _lastName;
  String _password;
  SignUpPageViewModel({@required this.authService});
  setname(String name) {
    _name = name;
    notifyListeners();
  }

  setlastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  setemail(String email) {
    _email = email;
    notifyListeners();
  }

  setpassword(String password) {
    _password = password;
    notifyListeners();
  }

  signUp() async {
    // try {
    await authService.signUp(_name, _lastName, _email, _password);
    await Get.off(SignInPage());
    // } catch (e) {
    // Get.snackbar(
    //   'ورود موفقیت آمیز نبود',
    //   e.toString(),
    //   backgroundColor: Colors.white,
    // );
    // }
  }
}
