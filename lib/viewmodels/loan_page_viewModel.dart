import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';

class LoanPageViewModel extends BaseViewModel {
  bool _active = false;
  bool isduplicate;
  User user;
  List<CreateLoan> retrivedLoans = [];
  List<String> _joinedMembers = [];
  FirestoreService firestoreService;
  GlobalState globalState;
  LoanPageViewModel(
      {@required this.firestoreService, @required this.globalState});

  Future getLoansFromDB() async {
    setBusy(true);
    retrivedLoans = await firestoreService.getLoansFromDB();
    setBusy(false);
  }

  getLoansFromGlobalState() {
    retrivedLoans = globalState.loans;
  }

  Future getUserName(CreateLoan loan) async {
    user = await firestoreService.retrivedUser();
    if (loan.joinedMemberId.isEmpty) {
      await loan.joinedMemberId.add(user.id);
      await loan.joinedMemberFullName.add(user.firstName + ' ' + user.lastName);
    } else {
      if (loan.joinedMemberId.contains(user.id)) {
        print('user is already exists');
      } else {
        await loan.joinedMemberId.add(user.id);
        await loan.joinedMemberFullName
            .add(user.firstName + ' ' + user.lastName);
      }
    }
  }

  Future updateJoinedMember(CreateLoan loan, List<String> joinedMembers) async {
    await firestoreService.updateJoinedMembers(loan, joinedMembers);
  }

  seteActive(bool active) {
    _active = active;
    notifyListeners();
  }

  bool get active => _active;

  seteJoinedMembers(List<String> joinedMembers) {
    _joinedMembers = joinedMembers;
    notifyListeners();
  }

  List<String> get joinedMembers => _joinedMembers;
}
