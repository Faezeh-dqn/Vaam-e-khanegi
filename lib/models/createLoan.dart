import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CreateLoan {
  String id;
  String name;
  String description;
  List<String> joinedMemberId;
  List<String> joinedMemberFullName;
  String requierdMembers;
  String amount;

  CreateLoan(
      {@required this.id,
      @required this.amount,
      @required this.description,
      @required this.name,
      @required this.requierdMembers,
      this.joinedMemberId,
      this.joinedMemberFullName});

  CreateLoan copyWith({
    String id,
    String name,
    String description,
    List<String> joinedMemberId,
    List<String> joinedMemberFullName,
    String requierdMembers,
    String amount,
  }) {
    return CreateLoan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      joinedMemberId: joinedMemberId ?? this.joinedMemberId,
      joinedMemberFullName: joinedMemberFullName ?? this.joinedMemberFullName,
      requierdMembers: requierdMembers ?? this.requierdMembers,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'joinedMemberId': joinedMemberId,
      'joinedMemberFullName': joinedMemberFullName,
      'requierdMembers': requierdMembers,
      'amount': amount,
    };
  }

  factory CreateLoan.fromMap(Map<String, dynamic> map) {
    return CreateLoan(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      joinedMemberId: map['joinedMemberId'] != null
          ? List<String>.from(map['joinedMemberId'])
          : null,
      joinedMemberFullName: map['joinedMemberFullName'] != null
          ? List<String>.from(map['joinedMemberFullName'])
          : null,
      requierdMembers: map['requierdMembers'],
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateLoan.fromJson(String source) =>
      CreateLoan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreateLoan(id: $id, name: $name, description: $description, joinedMemberId: $joinedMemberId,joinedMemberFullName: $joinedMemberFullName, requierdMembers: $requierdMembers, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateLoan &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        listEquals(other.joinedMemberId, joinedMemberId) &&
        listEquals(other.joinedMemberFullName, joinedMemberFullName) &&
        other.requierdMembers == requierdMembers &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        joinedMemberId.hashCode ^
        joinedMemberFullName.hashCode ^
        requierdMembers.hashCode ^
        amount.hashCode;
  }
}
