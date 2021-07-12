import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaam_khanegi/models/createLoan.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/authentication_service.dart';

class FirestoreService {
  final FirebaseFirestore fireStore;
  final AuthenticationService authenticationService;
  final String userCollection = 'users';
  final String createLoanCollection = 'createdLoan';
  FirestoreService({this.authenticationService, this.fireStore});

  Future createUser(User user) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .set(user.toMap());
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
    List<Loan> loans = [];

    QuerySnapshot querySnapshot =
        await fireStore.collection(createLoanCollection).get();
    querySnapshot.docs.forEach((snapshot) {
      Loan loan = Loan.fromMap(snapshot.data());

      loans.add(loan);
    });
    return loans;
  }
}
