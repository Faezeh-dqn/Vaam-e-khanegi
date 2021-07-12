import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Installment {
  String id;
  String loanId;
  int amount;
  String status;
  DateTime dueDate;
  String name;
  Installment({
    @required this.id,
    @required this.loanId,
    @required this.amount,
    @required this.status,
    @required this.dueDate,
    @required this.name,
  });

  Installment copyWith({
    String id,
    String loanId,
    int amount,
    String status,
    DateTime dueDate,
    String name,
  }) {
    return Installment(
      id: id ?? this.id,
      loanId: loanId ?? this.loanId,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'loanId': loanId,
      'amount': amount,
      'status': status,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'name': name,
    };
  }

  factory Installment.fromMap(Map<String, dynamic> map) {
    return Installment(
      id: map['id'],
      loanId: map['loanId'],
      amount: map['amount'],
      status: map['status'],
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate']),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Installment.fromJson(String source) =>
      Installment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Installment(id: $id, loanId: $loanId, amount: $amount, status: $status, dueDate: $dueDate, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Installment &&
        other.id == id &&
        other.loanId == loanId &&
        other.amount == amount &&
        other.status == status &&
        other.dueDate == dueDate &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        loanId.hashCode ^
        amount.hashCode ^
        status.hashCode ^
        dueDate.hashCode ^
        name.hashCode;
  }
}
