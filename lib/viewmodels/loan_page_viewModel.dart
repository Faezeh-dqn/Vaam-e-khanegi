import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

class LoanPageViewModel extends BaseViewModel {
  bool _active = false;
  int _joinedMembers;
  List<Loan> retrivedLoans = [];
  FirestoreService firestoreService;
  LoanPageViewModel({@required this.firestoreService});

  Future getLoansFromDB() async {
    setBusy(true);
    retrivedLoans = await firestoreService.getLoansFromDB();
    setBusy(false);
  }

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
