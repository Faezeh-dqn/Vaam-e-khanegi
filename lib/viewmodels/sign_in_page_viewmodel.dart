import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/services/authentication_service.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

class SignInViewModel extends BaseViewModel {
  final AuthenticationService authenticationService;

  SignInViewModel({@required this.authenticationService});

  String _email = '';
  String _password = '';

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  signIn() async {
    try {
      await authenticationService.signIn(email: _email, password: _password);
      await Get.off(MenuPage());
    } on AuthException catch (e) {
      Get.snackbar('Couldnt Sing in', e.message, backgroundColor: Colors.white);
    }
  }
}
