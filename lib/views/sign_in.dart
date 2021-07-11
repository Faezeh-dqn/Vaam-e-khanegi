import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/viewmodels/sign_in_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import 'package:vaam_khanegi/views/sign_up.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => getIt<SignInViewModel>(),
      builder: (context, model, _) => Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Color(0xff00A551),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Padding(
                    padding: EdgeInsets.only(top: 35, left: 270),
                    child: Text(
                      'ورود',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 140,
                ),
                Container(
                  width: 380,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ایمیل',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) => model.setEmail(value),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 380,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'رمز ورود',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) => model.setPassword(value),
                  ),
                ),
                RaisedButton(
                  color: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Text(
                          'ثبت نام کنید',
                          style: TextStyle(
                              color: Color(0xff00A551),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'حساب کاربری ندارید؟ ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Container(
                    height: 60,
                    width: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        model.signIn();
                      },
                      color: Color(0xff00A551),
                      child: Text(
                        'ورود',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
