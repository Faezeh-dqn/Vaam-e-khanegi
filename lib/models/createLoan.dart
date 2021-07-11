import 'package:flutter/cupertino.dart';

class CreateLoan {
  String name;
  String description;
  int installments;
  int requierdMembers;
  int amount;

  CreateLoan(
      {@required this.amount,
      @required this.description,
      @required this.installments,
      @required this.name,
      @required this.requierdMembers});
}
