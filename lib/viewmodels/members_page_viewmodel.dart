import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/member.dart';

import 'package:vaam_khanegi/services/member_service.dart';
import 'package:vaam_khanegi/viewmodels/sign_in_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/sign_up_page_viewmodel.dart';

class MembersPageViewModel extends BaseViewModel {
  final MemberService memberService;
  MembersPageViewModel({@required this.memberService});

  List<Member> _members = [];
  List<Member> get members => _members;

  getMembers() async {
    _members = await memberService.getMembers();
    notifyListeners();
  }
}
