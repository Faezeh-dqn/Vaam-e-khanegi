import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaam_khanegi/views/createLoan_page.dart';

import 'package:vaam_khanegi/views/loan.dart';
import 'package:vaam_khanegi/views/members.dart';
import 'package:vaam_khanegi/views/varizi.dart';
import 'package:vaam_khanegi/views/withdraw_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'صفحه اصلی',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuPageItems(
                    color: Color(0xffFF993A),
                    itemName: 'وام ها',
                    onPressed: () {
                      Get.to(() => LoanPage());
                    }),
                MenuPageItems(
                    color: Color(0xff69CA2E),
                    itemName: 'اقساط',
                    onPressed: () {
                      Get.to(() => LoanPage());
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuPageItems(
                    color: Colors.amberAccent.shade200,
                    itemName: 'برداشت ها',
                    onPressed: () {
                      Get.to(() => withDrawPage());
                    }),
                MenuPageItems(
                    color: Color(0xff4221C6),
                    itemName: 'واریزی ها',
                    onPressed: () {
                      Get.to(() => VariziPage());
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuPageItems(
                  itemName: 'اعضا',
                  color: Color(0xffBF0A2A),
                  onPressed: () {
                    Get.to(() => MemberPage());
                  },
                ),
                MenuPageItems(
                  itemName: 'ایجاد وام',
                  color: Color(0xffFF3AEB),
                  onPressed: () {
                    Get.to(() => CreateLoanPage());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPageItems extends StatelessWidget {
  String itemName;
  Color color;
  VoidCallback onPressed;
  MenuPageItems(
      {@required this.color,
      @required this.itemName,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: color,
      ),
      width: 150,
      height: 150,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          itemName,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
