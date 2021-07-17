import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/withdraw_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

import '../service_locator.dart';

class WithDrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WithdrawPageViewModel>.reactive(
        viewModelBuilder: () => getIt<WithdrawPageViewModel>(),
        onModelReady: (model) => model.findUserLoans(),
        builder: (context, model, child) => Scaffold(
              body: (model.retrivedLoans.isEmpty)
                  ? Center(
                      child: Text(
                        'زمان برداشت وام شما فرا نرسیده',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                        children: [
                                          Text(
                                            'زمانی که موعد قرعه کشی شده برای وام شما فرا برسد وام به طور خودکار برای شما در این قسمت اضاف می گردد',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.info),
                                color: Colors.greenAccent.shade700,
                                iconSize: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'برداشت ها',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            height: 10,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.amberAccent.shade200,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: model.retrivedLoans.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RaisedButton(
                                        onPressed: () async {
                                          await model.addWithdrawsToDB(
                                              model.retrivedLoans);
                                        },
                                        color: Colors.amberAccent.shade400,
                                        child: Text(
                                          'برداشت',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        model.retrivedLoans[index].name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
                                color: Colors.amberAccent.shade200,
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
                          ),
                        ],
                      ),
                    ),
            ));
  }
}
