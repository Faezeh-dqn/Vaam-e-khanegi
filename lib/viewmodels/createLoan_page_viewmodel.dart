import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';
import 'package:vaam_khanegi/services/systemClock.dart';

import '../service_locator.dart';

class CreateLoanPageViewModel extends BaseViewModel {
  String _name;
  String _description;
  String _amount;
  String _installments;
  String _requierdMembers;

  FirestoreService firestoreService;
  GlobalState globalState;
  CreateLoanPageViewModel(
      {@required this.firestoreService, @required this.globalState});

  Future createLoan() async {
    CreateLoan createLoan = CreateLoan(
      id: getIt<SystemClock>()
          .getCurrentTime()
          .millisecondsSinceEpoch
          .toString(),
      amount: amount,
      description: description,
      name: name,
      requierdMembers: requierdMembers,
      joinedMemberId: [],
      winnersInOrder: [],
    );

    await firestoreService.createLoan(createLoan);
    globalState.loans.clear();
    await firestoreService.getLoansFromDB();
  }

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
