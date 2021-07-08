import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaam_khanegi/views/aghsat_page.dart';
import 'package:vaam_khanegi/views/members.dart';
import 'package:vaam_khanegi/views/vaam.dart';
import 'package:vaam_khanegi/views/varizi.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              'صفحه اصلی',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              color: Color(0xffFF993A),
              width: 350,
              height: 65,
              child: TextButton(
                onPressed: () {
                  Get.to(() => VaamPage());
                },
                child: Text(
                  'وام',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color(0xff69CA2E),
              width: 350,
              height: 65,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'قسط',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.amber,
              width: 350,
              height: 65,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'برداشت ها',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color(0xff4221C6),
              width: 350,
              height: 65,
              child: TextButton(
                onPressed: () {
                  Get.to(() => VariziPage());
                },
                child: Text(
                  'واریزی',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color(0xffBF0A2A),
              width: 350,
              height: 65,
              child: TextButton(
                onPressed: () {
                  Get.to(() => MembersPage());
                },
                child: Text(
                  'اعضا',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
