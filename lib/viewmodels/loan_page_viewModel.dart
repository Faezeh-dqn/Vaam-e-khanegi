import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/loan.dart';

class LoanPageViewModel extends BaseViewModel {
  bool _active = false;
  int _joinedMembers;
  List<Loan> retrivedLoans = [
    Loan(
        amount: 3,
        description:
            'مبلغ هر قسط 375000 تومان می باشد و در 8 ماه دریافت می گردد.',
        name: 'وام 3 میلیون تومانی',
        requierdMembers: 10,
        joinedMembers: ['علی', 'حسین ', 'سیما']),
    Loan(
        amount: 5,
        description:
            'مبلغ هر قسط 417000 تومان می باشد و در 12 ماه دریافت می گردد.',
        name: 'وام 3 میلیون تومانی',
        requierdMembers: 12,
        joinedMembers: ['سیمین', 'سوسن ', 'رضا'])
  ];

  seteActive(bool active) {
    _active = active;
    notifyListeners();
  }

  bool get active => _active;

  seteJoinedMembers(int joinedMembers) {
    _joinedMembers = joinedMembers;
    notifyListeners();
  }

  int get joinedMembers => _joinedMembers;
}
