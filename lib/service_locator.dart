import 'package:get_it/get_it.dart';
import 'package:vaam_khanegi/services/auth_service.dart';
import 'package:vaam_khanegi/services/member_service.dart';
import 'package:vaam_khanegi/viewmodels/add_member_form_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/aghsat_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/members_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/sign_up_page_viewmodel.dart';
import 'package:vaam_khanegi/viewmodels/vaam_page_viewModel.dart';
import 'package:vaam_khanegi/viewmodels/varizi_page_viewModel.dart';
import 'package:vaam_khanegi/views/add_member_form.dart';
import 'package:vaam_khanegi/views/members.dart';

import 'viewmodels/sign_in_page_viewmodel.dart';
import 'viewmodels/sign_in_page_viewmodel.dart';

GetIt getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<MemberService>(
    MemberService(
      authService: getIt<AuthService>(),
    ),
  );

  getIt.registerSingleton<VariziPageViewModel>(
    VariziPageViewModel(),
  );

  getIt.registerFactory(
    () => MembersPageViewModel(
      memberService: getIt<MemberService>(),
    ),
  );

  getIt.registerFactory(
    () => VaamPageViewModel(),
  );
  getIt.registerFactory(
    () => AghsatPageViewModel(),
  );

  getIt.registerFactory<AddMemberFormViewModel>(
    () => AddMemberFormViewModel(
      memberService: getIt<MemberService>(),
    ),
  );

  getIt.registerFactory<SignInPageViewModel>(
    () => SignInPageViewModel(
      authService: getIt<AuthService>(),
    ),
  );
  getIt.registerFactory<SignUpPageViewModel>(
    () => SignUpPageViewModel(
      authService: getIt<AuthService>(),
    ),
  );
}
