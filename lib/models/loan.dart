import 'dart:core';

import 'package:flutter/cupertino.dart';

class Loan {
  String id;
  String name;
  String description;
  int amount;
  List<String> joinedMembers;
  int requierdMembers;
  DateTime lotteryDate;
  List<String> winnerInOrder;

  Loan(
      {@required this.amount,
      @required this.description,
      @required this.name,
      @required this.requierdMembers,
      this.id,
      this.joinedMembers,
      this.lotteryDate,
      this.winnerInOrder});
}
