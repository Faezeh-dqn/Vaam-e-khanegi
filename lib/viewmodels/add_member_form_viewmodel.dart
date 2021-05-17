import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/member.dart';
import 'package:vaam_khanegi/services/member_service.dart';

class AddMemberFormViewModel extends BaseViewModel {
  final MemberService memberService;
  AddMemberFormViewModel({@required this.memberService});

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController ssn = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController creditCard = TextEditingController();
  TextEditingController money = TextEditingController();

  addMember() async {
    Member member = Member(
      name: name.text,
      lastname: lastname.text,
      // email: email.text,
      // password: password.text,
      // fatherName: fatherName.text,
      // birthdate: birthdate.text,
      // ssn: ssn.text,
      // telephone: int.parse(telephone.text),
      // phoneNumber: int.parse(phoneNumber.text),
      // address: address.text,
      // accountNumber: accountNumber.text,
      // creditCard: creditCard.text,
      // money: int.parse(money.text),
    );
    await memberService.addMember(member);
  }
}
