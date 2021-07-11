import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaam_khanegi/service_locator.dart';

import 'package:vaam_khanegi/views/menu_page.dart';
import 'package:vaam_khanegi/views/sign_in.dart';
import 'package:vaam_khanegi/views/sign_up.dart';
import 'package:vaam_khanegi/views/startPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
