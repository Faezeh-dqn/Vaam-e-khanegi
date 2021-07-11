import 'package:flutter/foundation.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;

  User({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
  });

  User copyWith({
    String firstName,
    String lastName,
    String email,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
    );
  }

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^ lastName.hashCode ^ email.hashCode;
  }
}
