import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

class MenuPageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  MenuPageViewModel({@required this.firestoreService});

  bool _adminRole = false;
  User user;
  String _name;
  String _lastName;

  setAdminRole(bool adminRole) {
    _adminRole = adminRole;
    notifyListeners();
  }

  bool get adminRole => _adminRole;

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;

  setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  String get lastName => _lastName;

  Future getRole() async {
    setBusy(true);
    user = await firestoreService.retrivedUser();
    setBusy(false);
    await setName(user.firstName);
    print(user.firstName);
    print(user.lastName);
    await setLastName(user.lastName);
    if (user.role == 'admin') {
      setAdminRole(true);
    }
  }
}
