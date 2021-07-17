import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/models/withdraw.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';
import 'package:vaam_khanegi/services/systemClock.dart';

import '../service_locator.dart';

class WithdrawPageViewModel extends BaseViewModel {
  List<CreateLoan> retrivedLoans = [];
  List<Withdraw> withdraws = [];
  FirestoreService firestoreService;
  GlobalState globalState;
  WithdrawPageViewModel(
      {@required this.firestoreService, @required this.globalState});
  List<CreateLoan> loansFromGlobalState = [];
  List date = [];
  DateTime dateTime;
  List<DateTime> _dateTimes = [];
  List<CreateLoan> _seperatedLoans = [];

  getLoansFromGlobalState() {
    loansFromGlobalState = globalState.loans;

    notifyListeners();
  }

  setDateTimes(List<DateTime> dateTimes) {
    _dateTimes = dateTimes;
    notifyListeners();
  }

  List<DateTime> get dateTimes => _dateTimes;

  setSeperatedLoans(List<CreateLoan> seperatedLoans) {
    _seperatedLoans = seperatedLoans;
    notifyListeners();
  }

  List<CreateLoan> get seperatedLoans => _seperatedLoans;

  Future addWithdrawsToDB(List<CreateLoan> createLoan) async {
    createLoan.forEach(
      (element) async {
        Withdraw withdraw = Withdraw(
          amount: element.amount,
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          loanId: element.id,
          name: element.name,
        );
        await firestoreService.addWithdraw(withdraw);
      },
    );
  }

  Future findUserLoans() async {
    setBusy(true);
    await getLoansFromGlobalState();
    User user = await firestoreService.retrivedUser();
    setBusy(false);
    String id = user.id;

    loansFromGlobalState.forEach(
      (element) {
        if (element.winnersInOrder.contains(id) &&
            element.requierdMembers ==
                element.joinedMemberId.length.toString()) {
          seperatedLoans.add(element);
        }
      },
    );

    notifyListeners();

    for (var i = 0; i <= seperatedLoans.length - 1; i++) {
      int userIndex = seperatedLoans[i].winnersInOrder.indexOf(user.id) + 1;
      print('seperatedloan[i] is : ${seperatedLoans[i]}');
      print('user id is : ${user.id}');
      DateTime dateTime =
          seperatedLoans[i].lotteryDate.add(Duration(days: 30 * userIndex));
      print('dateTime is : $dateTime');

      if (getIt<SystemClock>().getCurrentTime().isAfter(dateTime)) {
        print('xxx${getIt<SystemClock>().getCurrentTime()}');
        retrivedLoans.add(seperatedLoans[i]);
        print('datetime now is : ${DateTime.now()}');
      } else {}
    }
  }
}
