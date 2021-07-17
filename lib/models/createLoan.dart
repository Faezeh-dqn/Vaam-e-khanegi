import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CreateLoan {
  String id;
  String name;
  String description;
  List<String> joinedMemberId;
  List<String> winnersInOrder;
  String requierdMembers;
  String amount;
  DateTime lotteryDate;

  CreateLoan(
      {@required this.id,
      @required this.amount,
      @required this.description,
      @required this.name,
      @required this.requierdMembers,
      this.joinedMemberId,
      this.winnersInOrder,
      this.lotteryDate});

  bool get hasEmptySlot => joinedMemberId.length < int.parse(requierdMembers);

  DateTime paymentDateFor(String userId) {
    int userIndex = winnersInOrder.indexOf(userId) + 1;
    return lotteryDate.add(Duration(days: 30 * userIndex));
  }

  CreateLoan copyWith({
    String id,
    String name,
    String description,
    List<String> joinedMemberId,
    List<String> winnersInOrder,
    String requierdMembers,
    DateTime lotteryDate,
    String amount,
  }) {
    return CreateLoan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      lotteryDate: lotteryDate ?? this.lotteryDate,
      joinedMemberId: joinedMemberId ?? this.joinedMemberId,
      winnersInOrder: winnersInOrder ?? this.winnersInOrder,
      requierdMembers: requierdMembers ?? this.requierdMembers,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'lotteryDate':
          (lotteryDate != null) ? lotteryDate.millisecondsSinceEpoch : null,
      'joinedMemberId': joinedMemberId,
      'winnersInOrder': winnersInOrder,
      'requierdMembers': requierdMembers,
      'amount': amount,
    };
  }

  factory CreateLoan.fromMap(Map<String, dynamic> map) {
    return CreateLoan(
      id: map['id'],
      name: map['name'],
      lotteryDate: (map['lotteryDate'] != null)
          ? DateTime.fromMillisecondsSinceEpoch(map['lotteryDate'])
          : null,
      description: map['description'],
      joinedMemberId: map['joinedMemberId'] != null
          ? List<String>.from(map['joinedMemberId'])
          : null,
      winnersInOrder: map['winnersInOrder'] != null
          ? List<String>.from(map['winnersInOrder'])
          : null,
      requierdMembers: map['requierdMembers'],
      amount: map['amount'],
    );
  }

  @override
  String toString() {
    return 'CreateLoan(id: $id,lotteryDate:$lotteryDate, name: $name, description: $description, joinedMemberId: $joinedMemberId,joinedMemberId: $joinedMemberId,winnersInOrder:$winnersInOrder, requierdMembers: $requierdMembers, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateLoan &&
        other.id == id &&
        other.name == name &&
        other.lotteryDate == lotteryDate &&
        other.description == description &&
        listEquals(other.joinedMemberId, joinedMemberId) &&
        listEquals(other.winnersInOrder, winnersInOrder) &&
        other.requierdMembers == requierdMembers &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lotteryDate.hashCode ^
        name.hashCode ^
        description.hashCode ^
        winnersInOrder.hashCode ^
        joinedMemberId.hashCode ^
        requierdMembers.hashCode ^
        amount.hashCode;
  }
}
