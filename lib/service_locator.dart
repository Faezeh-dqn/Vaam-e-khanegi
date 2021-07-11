import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:vaam_khanegi/services/authentication_service.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

import 'package:vaam_khanegi/viewmodels/aghsat_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/createLoan_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/member_page_viewmodel.dart';

import 'package:vaam_khanegi/viewmodels/sign_up_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/loan_page_viewModel.dart';
import 'package:vaam_khanegi/viewmodels/varizi_page_viewModel.dart';
import 'package:vaam_khanegi/viewmodels/withdraw_page_viewmodel.dart';

import 'viewmodels/sign_in_page_viewmodel.dart';
import 'viewmodels/sign_in_page_viewmodel.dart';

GetIt getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<AuthenticationService>(
    AuthenticationService(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerSingleton<FirestoreService>(
    FirestoreService(
      fireStore: FirebaseFirestore.instance,
      authenticationService: getIt<AuthenticationService>(),
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
    ),
  );

  getIt.registerSingleton<VariziPageViewModel>(
    VariziPageViewModel(),
  );

  getIt.registerFactory(
    () => LoanPageViewModel(),
  );
  getIt.registerFactory(
    () => CreateLoanPageViewModel(),
  );
  getIt.registerFactory(
    () => AghsatPageViewModel(),
  );

  getIt.registerFactory(
    () => MemberPageViewModel(),
  );
  getIt.registerFactory(
    () => WithdrawPageViewModel(),
  );
}
