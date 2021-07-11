import 'dart:core';

import 'package:flutter/cupertino.dart';

class Loan {
  String id;
  String name;
  String description;
  int amount;
  int requierdMembers;
  List<String> joinedMembers;
  DateTime lotteryDate;
  List<String> winnersInOrder;

  Loan({
    @required this.amount,
    @required this.description,
    @required this.name,
    @required this.requierdMembers,
    @required this.id,
    @required this.joinedMembers,
    this.lotteryDate,
    this.winnersInOrder,
  });
}
