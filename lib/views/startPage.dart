import 'package:flutter/material.dart';
import 'package:vaam_khanegi/views/sign_up.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignUpPage()));
    });
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 250, right: 20),
            child: Text(
              'وام دونی',
              style: TextStyle(
                  fontSize: 64,
                  color: Color(0xff00A551),
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 130, left: 70),
            child: Image.asset(
              'images/giah.jpg',
              width: 200,
              height: 200,
            ),
          )
        ],
      ),
    ));
  }
}
