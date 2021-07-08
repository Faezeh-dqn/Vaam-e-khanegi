import 'package:stacked/stacked.dart';

class VariziPageViewModel extends BaseViewModel {
  String _description =
      'وام سه میلیونی فروردین واریز شده توسط آقای امینی در تاریخ 5 اردیبهشت';
  int _amount = 200;

  setamount(int amount) {
    _amount = amount;
    notifyListeners();
  }

  setemail(String description) {
    _description = description;
    notifyListeners();
  }

  int get amount => _amount;
  String get description => _description;
}
