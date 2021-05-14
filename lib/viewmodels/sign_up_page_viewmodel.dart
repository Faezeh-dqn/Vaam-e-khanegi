import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/user.dart';

class SIgnUpPageViewModel extends BaseViewModel {
  String _name;
  String _email;
  String _lastName;
  String _password;
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
}
