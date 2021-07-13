import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:vaam_khanegi/services/authentication_service.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';
import 'package:vaam_khanegi/viewmodels/createLoan_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/installments_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/member_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/sign_up_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/loan_page_viewModel.dart';
import 'package:vaam_khanegi/viewmodels/deposit_page_viewModel.dart';
import 'package:vaam_khanegi/viewmodels/withdraw_page_viewmodel.dart';
import 'viewmodels/sign_in_page_viewmodel.dart';

GetIt getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<AuthenticationService>(
    AuthenticationService(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerSingleton<GlobalState>(GlobalState());

  getIt.registerSingleton<FirestoreService>(
    FirestoreService(
      fireStore: FirebaseFirestore.instance,
      authenticationService: getIt<AuthenticationService>(),
      globalState: getIt<GlobalState>(),
    ),
  );

  getIt.registerFactory<SignUpViewModel>(
    () => SignUpViewModel(
      authenticationService: getIt<AuthenticationService>(),
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerFactory<SignInViewModel>(
    () => SignInViewModel(
        authenticationService: getIt<AuthenticationService>(),
        globalState: getIt<GlobalState>(),
        firestoreService: getIt<FirestoreService>()),
  );

  getIt.registerSingleton<DepositPageViewModel>(
    DepositPageViewModel(),
  );
  getIt.registerFactory(
    () => InstallmentPageViewModel(firestoreService: getIt<FirestoreService>()),
  );

  getIt.registerFactory(
    () => LoanPageViewModel(
        firestoreService: getIt<FirestoreService>(),
        globalState: getIt<GlobalState>()),
  );
  getIt.registerFactory(
    () => CreateLoanPageViewModel(
        firestoreService: getIt<FirestoreService>(),
        globalState: getIt<GlobalState>()),
  );

  getIt.registerFactory(
    () => MemberPageViewModel(firestoreService: getIt<FirestoreService>()),
  );
  getIt.registerFactory(
    () => WithdrawPageViewModel(),
  );
}
