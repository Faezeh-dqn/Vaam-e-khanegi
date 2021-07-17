import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/deposit.dart';
import 'package:vaam_khanegi/models/installment.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';
import 'package:vaam_khanegi/services/systemClock.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../service_locator.dart';

class InstallmentPageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  GlobalState globalState;
  InstallmentPageViewModel(
      {@required this.firestoreService, @required this.globalState});

  List<Installment> installments = [];
  List<Installment> installments1 = [];
  List<DateTime> dueDates = [];
  List<CreateLoan> loans = [];
  Color _color = Colors.grey.shade400;

  setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  Color get color => _color;

  Future getInstallments() async {
    await firestoreService.getLoansFromDB();
    setBusy(true);
    installments = await firestoreService.getInstallments();
    setBusy(false);
    installments1 = installments;
    installments1.sort((a, b) => a.dueDate.compareTo(b.dueDate));
  }

  Future updateStatus(String status, Installment installment) async {
    await firestoreService.updateInstallment(status, installment);

    Deposit deposit = Deposit(
      amount: installment.amount.toString(),
      name: installment.name,
      id: getIt<SystemClock>()
          .getCurrentTime()
          .millisecondsSinceEpoch
          .toString(),
      installmentId: installment.id,
      date: installment.dueDate,
    );

    await firestoreService.addDeposite(deposit);
  }

  String formatShamsiDate(DateTime dateTime) {
    Jalali jalali = Jalali.fromDateTime(dateTime);
    JalaliFormatter jalaliFormatter = jalali.formatter;
    String formatDate =
        '${jalaliFormatter.wN} , ${jalaliFormatter.d} ${jalaliFormatter.mN} ${jalaliFormatter.yyyy}';
    return formatDate;
  }
}
