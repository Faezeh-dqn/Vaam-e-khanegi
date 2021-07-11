import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';

class CreateLoanPageViewModel extends BaseViewModel {
  String _name;
  String _description;
  String _amount;
  String _installments;
  String _requierdMembers;
  List<CreateLoan> loans = [
    CreateLoan(
      amount: 3,
      description:
          'مبلغ هر قسط 375000 تومان می باشد و در 8 ماه دریافت می گردد.',
      installments: 8,
      name: 'وام 3 میلیون تومانی',
      requierdMembers: 10,
    ),
    CreateLoan(
      amount: 3,
      description:
          'مبلغ هر قسط 417000 تومان می باشد و در 12 ماه دریافت می گردد.',
      installments: 12,
      name: 'وام 5 میلیون تومانی',
      requierdMembers: 10,
    )
  ];

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;

  setAmount(String amount) {
    _amount = amount;
    notifyListeners();
  }

  String get amount => _amount;

  setDescription(String description) {
    _description = description;
    notifyListeners();
  }

  String get description => _description;

  setInstallments(installments) {
    _installments = installments;
    notifyListeners();
  }

  get installments => _installments;

  setRequierdMembers(String requierdMembers) {
    _requierdMembers = requierdMembers;
    notifyListeners();
  }

  String get requierdMembers => _requierdMembers;
}
