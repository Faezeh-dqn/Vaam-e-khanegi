import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/deposit.dart';

class DepositPageViewModel extends BaseViewModel {
  List<Deposit> deposits = [
    Deposit(
        amount: 375000,
        description: 'واریزی قسط اول وام 3 میلیون تومانی',
        name: 'وام 3 میلیون تومانی'),
    Deposit(
        amount: 417000,
        description: 'واریزی قسط اول وام 5 میلیون تومانی',
        name: 'وام 5 میلیون تومانی')
  ];
}
