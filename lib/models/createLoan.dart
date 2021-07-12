import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CreateLoan {
  String id;
  String name;
  String description;

  String requierdMembers;
  String amount;

  CreateLoan({
    @required this.id,
    @required this.amount,
    @required this.description,
    @required this.name,
    @required this.requierdMembers,
  });

  CreateLoan copyWith({
    String id,
    String name,
    String description,
    String requierdMembers,
    String amount,
  }) {
    return CreateLoan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      requierdMembers: requierdMembers ?? this.requierdMembers,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'requierdMembers': requierdMembers,
      'amount': amount,
    };
  }

  factory CreateLoan.fromMap(Map<String, dynamic> map) {
    return CreateLoan(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      requierdMembers: map['requierdMembers'],
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateLoan.fromJson(String source) =>
      CreateLoan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreateLoan(id: $id, name: $name, description: $description, requierdMembers: $requierdMembers, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateLoan &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.requierdMembers == requierdMembers &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        requierdMembers.hashCode ^
        amount.hashCode;
  }
}
