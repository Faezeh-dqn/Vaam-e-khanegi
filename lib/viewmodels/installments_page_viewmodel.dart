import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/installment.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

class InstallmentPageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  InstallmentPageViewModel({@required this.firestoreService});

  List installments = [
    Installment(
        name: 'وام 3 میلیون تومانی',
        amount: 375000,
        dueDate: DateTime.now(),
        status: 'پرداخت شده'),
    Installment(
        name: 'وام 5 میلیون تومانی',
        amount: 417000,
        dueDate: DateTime.now(),
        status: 'پرداخت شده'),
  ];
}
