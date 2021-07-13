import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/withdraw.dart';

class WithdrawPageViewModel extends BaseViewModel {
  List<Withdraw> withdraw = [
    Withdraw(
      name: 'وام 3 میلیون تومانی',
      amount: 125000,
    ),
    Withdraw(
      name: 'وام 5 میلیون تومانی',
      amount: 125000,
    )
  ];
}
