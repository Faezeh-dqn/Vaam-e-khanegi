import 'package:flutter/cupertino.dart';

class Deposit {
  String id;
  String installmentId;
  int amount;
  DateTime date;
  String description;

  Deposit(
      {@required this.amount,
      @required this.description,
      this.id,
      this.date,
      this.installmentId});
}