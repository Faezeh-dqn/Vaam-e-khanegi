import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vaam_khanegi/viewmodels/menu_page_viewmodel.dart';
import 'package:vaam_khanegi/views/chosen_page.dart';
import 'package:vaam_khanegi/views/createLoan_page.dart';
import 'package:vaam_khanegi/views/installment_page.dart';

import 'package:vaam_khanegi/views/loan.dart';
import 'package:vaam_khanegi/views/members.dart';
import 'package:vaam_khanegi/views/deposit.dart';
import 'package:vaam_khanegi/views/profile_page.dart';
import 'package:vaam_khanegi/views/withdraw_page.dart';

import '../service_locator.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuPageViewModel>.reactive(
        viewModelBuilder: () => getIt<MenuPageViewModel>(),
        onModelReady: (model) => model.getRole(),
        builder: (context, model, _) => (model.isBusy)
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '(:خوش آمدید',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '${model.name} ${model.lastName}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
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
                                Get.to(() => InstallmentsPage());
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MenuPageItems(
                              color: Colors.amberAccent.shade200,
                              itemName: 'برداشت ها',
                              onPressed: () {
                                Get.to(() => WithDrawPage());
                              }),
                          MenuPageItems(
                              color: Color(0xff4221C6),
                              itemName: 'واریزی ها',
                              onPressed: () {
                                Get.to(() => DepositPage());
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 16,
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
                            color: Color(0xff00C5AD),
                            itemName: 'وام های اخذ شده',
                            onPressed: () {
                              Get.to(() => ChosenLoanPage());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MenuPageItems(
                            itemName: 'ایجاد وام',
                            color: (model.adminRole == true)
                                ? Color(0xffFF3AEB)
                                : Colors.grey,
                            onPressed: () async {
                              if (model.adminRole == true) {
                                await Get.to(() => CreateLoanPage());
                              } else {
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.error(
                                    message:
                                        'دسترسی به این قسمت برای اعضا مجاز نیست ',
                                  ),
                                );
                              }
                            },
                          ),
                          MenuPageItems(
                            itemName: ' پروفایل',
                            color: Color(0xffB7006E),
                            onPressed: () {
                              Get.to(() => ProfilePage());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
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
      width: 140,
      height: 140,
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
