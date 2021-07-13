import 'package:stacked/stacked.dart';

class AghsatPageViewModel extends BaseViewModel {
  bool _active1 = true;
  bool _active2 = false;

  setActive1(bool active1) {
    _active1 = active1;
    notifyListeners();
  }

  bool get active1 => _active1;

  setActive2(bool active2) {
    _active2 = active2;
    notifyListeners();
  }

  bool get active2 => _active2;
}
