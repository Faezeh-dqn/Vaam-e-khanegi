import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaam_khanegi/views/aghsat_page.dart';

class PghetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 80, top: 23),
                  child: Text(
                    'پرداخت اقساط',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 10,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: Text(
                    'وام های اخذ شده',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 500),
                  child: Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        Get.to(() => AghsatPage());
                      },
                      child: Text(
                        'بازگشت',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
