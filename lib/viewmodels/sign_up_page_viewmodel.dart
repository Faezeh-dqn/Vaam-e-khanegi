import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/authentication_service.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService authenticationService;
  final FirestoreService firestoreService;

  SignUpViewModel(
      {@required this.authenticationService, @required this.firestoreService});

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  setFirstName(String firstName) {
    _firstName = firstName;
  }

  setLastName(String lastName) {
    _lastName = lastName;
  }

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  signUp() async {
    try {
      await authenticationService.signUp(email: _email, password: _password);
      User user = User(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        image: '',
      );
      await firestoreService.createUser(user);
      await Get.off(MenuPage());
    } on AuthException catch (e) {
      Get.snackbar('Couldnt Sing up', e.message, backgroundColor: Colors.white);
    }
  }
}
