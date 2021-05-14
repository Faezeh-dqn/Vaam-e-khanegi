import 'package:get_it/get_it.dart';
import 'package:vaam_khanegi/services/auth_service.dart';

import 'viewmodels/sign_in_page_viewmodel.dart';
import 'viewmodels/sign_in_page_viewmodel.dart';

GetIt getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<AuthService>(AuthService());

  getIt.registerFactory<SignInPageViewModel>(
    () => SignInPageViewModel(
      authService: getIt<AuthService>(),
    ),
  );
}
