import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';

class CreateLoanPageViewModel extends BaseViewModel {
  List<CreateLoan> loans = [
    CreateLoan(
        amount: 3,
        description:
            'مبلغ هر قسط 375000 تومان می باشد و در 8 ماه دریافت می گردد.',
        installments: 8,
        name: 'وام 3 میلیون تومانی',
        requierdMembers: 10),
    CreateLoan(
        amount: 3,
        description:
            'مبلغ هر قسط 417000 تومان می باشد و در 12 ماه دریافت می گردد.',
        installments: 12,
        name: 'وام 5 میلیون تومانی',
        requierdMembers: 10)
  ];

  String _name;

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;
}
