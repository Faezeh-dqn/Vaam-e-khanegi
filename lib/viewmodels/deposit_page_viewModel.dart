import 'package:flutter/cupertino.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/deposit.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

class DepositPageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  DepositPageViewModel({@required this.firestoreService});
  List<Deposit> deposits = [];

  Future getDeposits() async {
    setBusy(true);
    deposits = await firestoreService.getDeposit();
    setBusy(false);
  }

  String formatShamsiDate(DateTime dateTime) {
    Jalali jalali = Jalali.fromDateTime(dateTime);
    JalaliFormatter jalaliFormatter = jalali.formatter;
    String formatDate =
        '${jalaliFormatter.wN} , ${jalaliFormatter.d} ${jalaliFormatter.mN} ${jalaliFormatter.yyyy}';
    return formatDate;
  }
}
