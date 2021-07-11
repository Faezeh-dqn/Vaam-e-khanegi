import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/viewmodels/sign_up_page_viewmodel.dart';
import 'package:get/get.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => getIt<SignUpViewModel>(),
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
                          padding: EdgeInsets.only(top: 35, left: 240),
                          child: Text(
                            'ثبت نام',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        width: 380,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'نام',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) => model.setFirstName(value),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 380,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'نام خانوادگی',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) => model.setLastName(value),
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                          onChanged: (value) {
                            model.setPassword(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Container(
                          height: 60,
                          width: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            onPressed: () {
                              model.signUp();
                            },
                            color: Color(0xff00A551),
                            child: Text(
                              'ثبت نام',
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
            ));
  }
}
