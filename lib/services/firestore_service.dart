import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/deposit.dart';
import 'package:vaam_khanegi/models/installment.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/models/withdraw.dart';
import 'package:vaam_khanegi/services/authentication_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';

class FirestoreService {
  final FirebaseFirestore fireStore;
  final GlobalState globalState;
  final AuthenticationService authenticationService;
  final String userCollection = 'users';
  final String createLoanCollection = 'createdLoan';
  final String addedLoanCollection = 'addedLoan';
  final String installmentCollection = 'installments';
  final String depositCollection = 'deposits';
  final String withdrawCollection = 'withdraws';
  FirestoreService(
      {this.authenticationService, this.fireStore, this.globalState});

  Future createUser(User user) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    User updatedUser = user.copyWith(id: currentUserId);
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .set(updatedUser.toMap());
  }

  Future retrivedUser() async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;

    DocumentSnapshot documentSnapshot =
        await fireStore.collection(userCollection).doc(currentUserId).get();
    User retrivedUser = User.fromMap(documentSnapshot.data());
    return retrivedUser;
  }

  Future updateUser(User updatedUser) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .set(updatedUser.toMap());
    return updatedUser;
  }

  Future getMembers() async {
    List users = [];
    QuerySnapshot querySnapshot =
        await fireStore.collection(userCollection).get();

    querySnapshot.docs.forEach((snapshot) {
      User user = User.fromMap(snapshot.data());
      users.add(user);
    });
    return users;
  }

  Future createLoan(CreateLoan loan) async {
    await fireStore
        .collection(createLoanCollection)
        .doc(loan.id)
        .set(loan.toMap());
  }

  Future getLoansFromDB() async {
    QuerySnapshot querySnapshot =
        await fireStore.collection(createLoanCollection).get();
    querySnapshot.docs.forEach((snapshot) {
      CreateLoan loan = CreateLoan.fromMap(snapshot.data());

      globalState.loans.add(loan);
    });
    return globalState.loans;
  }

  Future updateJoinedMembers(CreateLoan loan, List<String> joinedMembersId,
      List<String> winnersInOrder, DateTime lotteryDate) async {
    DocumentSnapshot documentSnapshot =
        await fireStore.collection(createLoanCollection).doc(loan.id).get();

    CreateLoan retrivedLoan = CreateLoan.fromMap(documentSnapshot.data());
    CreateLoan updatedLoan = retrivedLoan.copyWith(
      joinedMemberId: joinedMembersId,
      winnersInOrder: winnersInOrder,
      lotteryDate: lotteryDate,
    );

    await fireStore
        .collection(createLoanCollection)
        .doc(loan.id)
        .set(updatedLoan.toMap());
  }

  Future getUSerById(String id) async {
    DocumentSnapshot documentSnapshot =
        await fireStore.collection(userCollection).doc(id).get();

    User user = User.fromMap(documentSnapshot.data());

    return user;
  }

  Future addLoanToUser(CreateLoan loan) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(addedLoanCollection)
        .doc()
        .set(loan.toMap());
  }

  Future getLoanFromUser() async {
    List<CreateLoan> addedLoans = [];
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    QuerySnapshot querySnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(addedLoanCollection)
        .get();

    querySnapshot.docs.forEach((snapshot) {
      CreateLoan loan = CreateLoan.fromMap(snapshot.data());

      addedLoans.add(loan);
    });
    return addedLoans;
  }

  Future getAddedLoanToPayInstallments() async {
    List<CreateLoan> addedLoan = [];
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    QuerySnapshot querySnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(addedLoanCollection)
        .get();

    querySnapshot.docs.forEach((snapshot) {
      CreateLoan loan = CreateLoan.fromMap(snapshot.data());

      addedLoan.add(loan);
    });
    return addedLoan;
  }

  Future addInstallment(Installment installment, String userId) async {
    await fireStore
        .collection(userCollection)
        .doc(userId)
        .collection(installmentCollection)
        .doc(installment.id)
        .set(installment.toMap());
  }

  Future getInstallments() async {
    List<Installment> installments = [];
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    QuerySnapshot querySnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(installmentCollection)
        .get();

    querySnapshot.docs.forEach((snapshot) {
      Installment installment = Installment.fromMap(snapshot.data());
      installments.add(installment);
    });

    return installments;
  }

  Future updateInstallment(String status, Installment installment) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;

    DocumentSnapshot documentSnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(installmentCollection)
        .doc(installment.id)
        .get();

    Installment retrivedInstallment =
        Installment.fromMap(documentSnapshot.data());

    Installment updatedInstallment =
        retrivedInstallment.copyWith(status: status);

    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(installmentCollection)
        .doc(installment.id)
        .set(updatedInstallment.toMap());
  }

  Future addDeposite(Deposit deposit) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(depositCollection)
        .doc(deposit.id)
        .set(deposit.toMap());
  }

  Future getDeposit() async {
    List<Deposit> deposits = [];
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;

    QuerySnapshot querySnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(depositCollection)
        .get();

    querySnapshot.docs.forEach((snapshot) {
      Deposit deposit = Deposit.fromMap(snapshot.data());
      deposits.add(deposit);
    });

    return deposits;
  }

  Future addWithdraw(Withdraw withdraw) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(withdrawCollection)
        .doc(withdraw.id)
        .set(withdraw.toMap());
  }

  Future getWithdraw() async {
    List<Withdraw> withdraws = [];
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;

    QuerySnapshot querySnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(depositCollection)
        .get();

    querySnapshot.docs.forEach((snapshot) {
      Withdraw withdraw = Withdraw.fromMap(snapshot.data());
      withdraws.add(withdraw);
    });

    return withdraws;
  }
}
