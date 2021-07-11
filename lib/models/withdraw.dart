import 'package:flutter/cupertino.dart';

class Withdraw {
  String loanId;
  String id;
  int amount;
  DateTime date;

  Withdraw({@required this.amount, this.date, this.id, this.loanId});
}
