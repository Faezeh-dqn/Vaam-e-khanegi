import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Loan {
  String id;
  String name;
  String description;
  String amount;
  String requierdMembers;
  List<String> joinedMembers;
  DateTime lotteryDate;
  List<String> winnersInOrder;

  Loan({
    @required this.amount,
    @required this.description,
    @required this.name,
    @required this.requierdMembers,
    @required this.id,
    this.joinedMembers,
    this.lotteryDate,
    this.winnersInOrder,
  });

  Loan copyWith({
    String id,
    String name,
    String description,
    String amount,
    String requierdMembers,
    List<String> joinedMembers,
    DateTime lotteryDate,
    List<String> winnersInOrder,
  }) {
    return Loan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      requierdMembers: requierdMembers ?? this.requierdMembers,
      joinedMembers: joinedMembers ?? this.joinedMembers,
      lotteryDate: lotteryDate ?? this.lotteryDate,
      winnersInOrder: winnersInOrder ?? this.winnersInOrder,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
      'requierdMembers': requierdMembers,
      'joinedMembers': joinedMembers,
      'lotteryDate': lotteryDate.millisecondsSinceEpoch,
      'winnersInOrder': winnersInOrder,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      amount: map['amount'],
      requierdMembers: map['requierdMembers'],
      joinedMembers: map['joinedMembers'] != null
          ? List<String>.from(map['joinedMembers'])
          : null,
      lotteryDate: map['lotteryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lotteryDate'])
          : null,
      winnersInOrder: map['winnersInOrder'] != null
          ? List<String>.from(map['winnersInOrder'])
          : null,
    );
  }

  @override
  String toString() {
    return 'Loan(id: $id, name: $name, description: $description, amount: $amount, requierdMembers: $requierdMembers, joinedMembers: $joinedMembers, lotteryDate: $lotteryDate, winnersInOrder: $winnersInOrder)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Loan &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.amount == amount &&
        other.requierdMembers == requierdMembers &&
        listEquals(other.joinedMembers, joinedMembers) &&
        other.lotteryDate == lotteryDate &&
        listEquals(other.winnersInOrder, winnersInOrder);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        requierdMembers.hashCode ^
        joinedMembers.hashCode ^
        lotteryDate.hashCode ^
        winnersInOrder.hashCode;
  }
}
