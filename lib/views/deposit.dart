import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/deposit_page_viewModel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import 'package:vaam_khanegi/views/loan.dart';

import '../service_locator.dart';

class DepositPage extends StatefulWidget {
  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DepositPageViewModel>.reactive(
        viewModelBuilder: () => getIt<DepositPageViewModel>(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 210, top: 23),
                      child: Text(
                        'واریزی ها',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 10,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff4221C6),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Text(
                                    model.deposits[index].name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4221C6),
                                    ),
                                  ),
                                  Text(
                                    'مبلغ واریزی : ${model.deposits[index].amount.toString()}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    model.deposits[index].description,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 60,
                      ),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: RaisedButton(
                          elevation: 0,
                          color: Color(0xff4221C6),
                          onPressed: () {
                            Get.to(() => MenuPage());
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
              ),
            ));
  }
}
