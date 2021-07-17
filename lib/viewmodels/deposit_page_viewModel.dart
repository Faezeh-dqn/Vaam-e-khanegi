import 'package:flutter/cupertino.dart';
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
}
