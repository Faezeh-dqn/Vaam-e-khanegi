import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/installment.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';
import 'package:vaam_khanegi/services/systemClock.dart';

class LoanPageViewModel extends BaseViewModel {
  bool isduplicate = false;
  User user;
  bool stop = false;

  List<CreateLoan> retrivedLoans = [];
  List<int> randomNumbers = [];
  List<String> nameOfWinners = [];
  List<String> _retrivedFullName = [];

  FirestoreService firestoreService;
  GlobalState globalState;
  LoanPageViewModel(
      {@required this.firestoreService, @required this.globalState});

  getLoansFromGlobalState() {
    retrivedLoans = globalState.loans;

    notifyListeners();
  }

  Future addLoanToUser(CreateLoan loan) async {
    await firestoreService.addLoanToUser(loan);
  }

  getNameOfWinners(CreateLoan loan) {
    loan.winnersInOrder.forEach((element) async {
      User retrivedUser = await firestoreService.getUSerById(element);
      nameOfWinners.add(retrivedUser.firstName + ' ' + retrivedUser.lastName);
      print(
          'string is : ${retrivedUser.firstName + ' ' + retrivedUser.lastName}');
      print('retrivedUser is : $nameOfWinners');
      print(loan.winnersInOrder);
    });
  }

  Future addIdToJoinedMemberId(CreateLoan loan) async {
    User user = await firestoreService.retrivedUser();

    if (loan.joinedMemberId.contains(user.id) == false) {
      loan.joinedMemberId.add(user.id);
      loan.joinedMemberId.forEach((element) async {
        User retrivedUser = await firestoreService.getUSerById(element);
        retrivedFullName
            .add(retrivedUser.firstName + ' ' + retrivedUser.lastName);
      });
      print('joinedme is :${loan.joinedMemberId}');
      print('retrivedFullname is : $retrivedFullName');
    }
    if (loan.requierdMembers.toString() ==
            loan.joinedMemberId.length.toString() &&
        stop == false) {
      loan.lotteryDate = getIt<SystemClock>().getCurrentTime();
      await lottery(loan);
      await addInstallmentsForEachUser(loan);
      stop = true;
    }
  }

  Future updateJoinedMember(
    CreateLoan loan,
    List<String> joinedMembersId,
    List<String> winnersInOrder,
    DateTime lotteryDate,
  ) async {
    await firestoreService.updateJoinedMembers(
        loan, joinedMembersId, winnersInOrder, lotteryDate);
  }

  setRetrivedFullName(List<String> retrivedFullName) {
    _retrivedFullName = retrivedFullName;
    notifyListeners();
  }

  List<String> get retrivedFullName => _retrivedFullName;

  lottery(CreateLoan loan) async {
    List<int> randomNumbers = [];
    for (int i = 0; i <= loan.joinedMemberId.length - 1; i++) {
      int randomNumber = Random().nextInt(loan.joinedMemberId.length);

      if (randomNumbers.isEmpty) {
        randomNumbers.add(randomNumber);
      } else if (randomNumbers.contains(randomNumber)) {
        bool foundUniqueNumber = false;

        while (!foundUniqueNumber) {
          int random = Random().nextInt(loan.joinedMemberId.length);

          if (!randomNumbers.contains(random)) {
            randomNumbers.add(random);

            foundUniqueNumber = true;
          }
        }
      } else {
        randomNumbers.add(randomNumber);
      }
    }

    randomNumbers.forEach((element) {
      String userId = loan.joinedMemberId[element];
      loan.winnersInOrder.add(userId);
    });
    print(randomNumbers);

    getNameOfWinners(loan);
  }

  addInstallmentsForEachUser(CreateLoan loan) async {
    for (var i = 0; i < loan.joinedMemberId.length; i++) {
      String userId = loan.joinedMemberId[i];
      for (int j = 1; j <= int.parse(loan.requierdMembers); j++) {
        int days = j * 30;
        Installment installment = Installment(
          id: getIt<SystemClock>()
              .getCurrentTime()
              .millisecondsSinceEpoch
              .toString(),
          loanId: loan.id,
          amount: int.parse(loan.amount) ~/ int.parse(loan.requierdMembers),
          status: 'پرداخت نشده',
          dueDate: loan.lotteryDate.add(Duration(days: days)),
          name: loan.name,
        );
        print(installment.dueDate);
        print(
          loan.lotteryDate.add(Duration(days: days)),
        );

        await firestoreService.addInstallment(installment, userId);
      }
    }
  }
}
