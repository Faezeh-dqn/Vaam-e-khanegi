import 'package:flutter/foundation.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  User({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.image,
  });

  User copyWith({
    String firstName,
    String lastName,
    String email,
    String image,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      image: map['image'],
    );
  }

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.image == image;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        image.hashCode;
  }
}
