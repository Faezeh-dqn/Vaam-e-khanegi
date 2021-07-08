import 'package:stacked/stacked.dart';

class VaamPageViewModel extends BaseViewModel {
  String _name = 'وام 3 میلیونی فروردین';
  String _type = 'اضطراری';
  int _minDepositRequierd = 100;
  int _amount = 3;
  int _restDays = 10;
  int _numberOfInstallments = 10;
  double _interestRate = 0.02;
  int _installmentsDeadLineDays = 365;
  bool _isShowable = true;

  String get name => _name;
  String get type => _type;
  int get minDepositRequierd => _minDepositRequierd;
  int get amount => _amount;
  int get restDays => _restDays;
  int get numberOfInstallments => _numberOfInstallments;
  double get interestRate => _interestRate;
  int get installmentsDeadLineDays => _installmentsDeadLineDays;
  bool get isShowable => _isShowable;
}
