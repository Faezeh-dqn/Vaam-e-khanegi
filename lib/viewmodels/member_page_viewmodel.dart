import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';

class MemberPageViewModel extends BaseViewModel {
  List members = [];
  FirestoreService firestoreService;
  MemberPageViewModel({@required this.firestoreService});
  Future getMembers() async {
    setBusy(true);
    members = await firestoreService.getMembers();

    setBusy(false);
  }

  loan() {
    GlobalState globalState = getIt<GlobalState>();
    List fetchedLoans = [];
    globalState.loans = fetchedLoans;
  }

  List loans = getIt<GlobalState>().loans;
}
