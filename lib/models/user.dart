import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User {
  User({@required this.email, @required this.lastName, @required this.name});
  final String name;
  final String lastName;
  final String email;
}
