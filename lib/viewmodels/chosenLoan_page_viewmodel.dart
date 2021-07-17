import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';

class ChosenLoanPageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  GlobalState globalState;
  ChosenLoanPageViewModel(
      {@required this.firestoreService, @required this.globalState});

  List<CreateLoan> loans = [];
  List date = [];
  DateTime dateTime;
  List<DateTime> _dateTimes = [];
  List<CreateLoan> _seperatedLoans = [];
  getLoansFromGlobalState() {
    loans = globalState.loans;

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

  Future findUserLoans() async {
    setBusy(true);
    await getLoansFromGlobalState();
    User user = await firestoreService.retrivedUser();
    setBusy(false);
    String id = user.id;

    loans.forEach(
      (element) {
        if (element.winnersInOrder.contains(id) &&
            element.requierdMembers ==
                element.joinedMemberId.length.toString()) {
          seperatedLoans.add(element);
        }
      },
    );

    seperatedLoans.forEach((element) {
      int userIndex = element.winnersInOrder.indexOf(user.id) + 1;
      DateTime dateTime =
          element.lotteryDate.add(Duration(days: 30 * userIndex));
      dateTimes.add(dateTime);
    });
    print(dateTimes);
    print(seperatedLoans.length);
    notifyListeners();
  }
}
