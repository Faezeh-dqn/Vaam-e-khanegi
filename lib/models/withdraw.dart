import 'package:flutter/cupertino.dart';

class Withdraw {
  String loanId;
  String id;
  int amount;
  DateTime date;
  String name;

  Withdraw(
      {@required this.amount,
      this.date,
      this.id,
      this.loanId,
      @required this.name});
}
