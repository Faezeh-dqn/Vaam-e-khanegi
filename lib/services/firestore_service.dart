import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/authentication_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';

class FirestoreService {
  final FirebaseFirestore fireStore;
  final GlobalState globalState;
  final AuthenticationService authenticationService;
  final String userCollection = 'users';
  final String createLoanCollection = 'createdLoan';
  FirestoreService(
      {this.authenticationService, this.fireStore, this.globalState});

  Future createUser(User user) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .set(user.toMap());
  }

  Future retrivedUser() async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;

    DocumentSnapshot documentSnapshot =
        await fireStore.collection(userCollection).doc(currentUserId).get();
    User retrivedUser = User.fromMap(documentSnapshot.data());
    return retrivedUser;
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

  Future updateJoinedMembers(
      CreateLoan loan, List<String> joinedMembers) async {
    DocumentSnapshot documentSnapshot =
        await fireStore.collection(createLoanCollection).doc(loan.id).get();

    CreateLoan retrivedLoan = CreateLoan.fromMap(documentSnapshot.data());
    CreateLoan updatedLoan = retrivedLoan.copyWith(
        joinedMemberFullName: loan.joinedMemberFullName + joinedMembers);

    await fireStore
        .collection(createLoanCollection)
        .doc(loan.id)
        .set(updatedLoan.toMap());
  }
}
