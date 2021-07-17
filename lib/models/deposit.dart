import 'dart:convert';

import 'package:flutter/foundation.dart';

class Deposit {
  String id;
  String installmentId;
  String amount;
  DateTime date;

  String name;

  Deposit(
      {@required this.amount,
      @required this.id,
      @required this.date,
      @required this.installmentId,
      @required this.name});

  Deposit copyWith({
    String id,
    String installmentId,
    String amount,
    DateTime date,
    String name,
  }) {
    return Deposit(
      id: id ?? this.id,
      installmentId: installmentId ?? this.installmentId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'installmentId': installmentId,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'name': name,
    };
  }

  factory Deposit.fromMap(Map<String, dynamic> map) {
    return Deposit(
      id: map['id'],
      installmentId: map['installmentId'],
      amount: map['amount'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Deposit.fromJson(String source) =>
      Deposit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Deposit(id: $id, installmentId: $installmentId, amount: $amount, date: $date, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Deposit &&
        other.id == id &&
        other.installmentId == installmentId &&
        other.amount == amount &&
        other.date == date &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        installmentId.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        name.hashCode;
  }
}
