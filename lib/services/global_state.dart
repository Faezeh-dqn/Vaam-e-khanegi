import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

import '../service_locator.dart';

class GlobalState {
  List<CreateLoan> loans = [];
}
