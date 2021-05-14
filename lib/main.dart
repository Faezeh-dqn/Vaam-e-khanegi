import 'package:flutter/material.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/views/members.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import 'package:vaam_khanegi/views/sign_in.dart';
import 'package:vaam_khanegi/views/sign_up.dart';
import 'package:vaam_khanegi/views/startPage.dart';

void main() {
  setUpGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
