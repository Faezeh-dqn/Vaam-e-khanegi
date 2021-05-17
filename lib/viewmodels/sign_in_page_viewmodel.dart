import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stacked/stacked.dart';

import 'package:vaam_khanegi/services/auth_service.dart';

import '../views/menu_page.dart';

class SignInPageViewModel extends BaseViewModel {
  final AuthService authService;
  String _password;
  String _email;
  SignInPageViewModel({@required this.authService});

  setpassword(String password) {
    _password = password;
    notifyListeners();
  }

  setemail(String email) {
    _email = email;
    notifyListeners();
  }

  signIn() async {
    try {
      await authService.singIn(_email, _password);
      await Get.to(MenuPage());
    } catch (e) {
      Get.snackbar(
        'ورود موفقیت آمیز نبود',
        e.toString(),
        backgroundColor: Colors.white,
      );
    }
  }
}
