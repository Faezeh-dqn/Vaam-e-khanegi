import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

class MemberPageViewModel extends BaseViewModel {
  List members = [];
  FirestoreService firestoreService;
  MemberPageViewModel({@required this.firestoreService});
  Future getMembers() async {
    setBusy(true);
    members = await firestoreService.getMembers();
    setBusy(false);
  }
}
