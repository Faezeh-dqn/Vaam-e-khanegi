import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Withdraw {
  String loanId;
  String id;
  String amount;
  String status;
  String name;

  Withdraw(
      {@required this.amount,
      @required this.id,
      @required this.loanId,
      @required this.name,
      @required this.status});

  Withdraw copyWith({
    String loanId,
    String id,
    String amount,
    String name,
    String status,
  }) {
    return Withdraw(
      status: status ?? this.status,
      loanId: loanId ?? this.loanId,
      id: id ?? this.id,
      amount: amount ?? this.amount,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'loanId': loanId,
      'id': id,
      'amount': amount,
      'name': name,
    };
  }

  factory Withdraw.fromMap(Map<String, dynamic> map) {
    return Withdraw(
      status: map['status'],
      loanId: map['loanId'],
      id: map['id'],
      amount: map['amount'],
      name: map['name'],
    );
  }

  @override
  String toString() {
    return 'Withdraw(status : $status,loanId: $loanId, id: $id, amount: $amount,  name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Withdraw &&
        other.loanId == loanId &&
        other.id == id &&
        other.status == status &&
        other.amount == amount &&
        other.name == name;
  }

  @override
  int get hashCode {
    return loanId.hashCode ^
        id.hashCode ^
        amount.hashCode ^
        name.hashCode ^
        status.hashCode;
  }
}
