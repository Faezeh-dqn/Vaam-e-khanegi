import 'package:stacked/stacked.dart';

class SignInPageViewModel extends BaseViewModel {
  String _password;
  String _email;

  setpassword(String password) {
    _password = password;
    notifyListeners();
  }

  setemail(String email) {
    _email = email;
    notifyListeners();
  }
}
