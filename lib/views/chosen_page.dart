import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/chosenLoan_page_viewmodel.dart';

import '../service_locator.dart';
import 'menu_page.dart';

class ChosenLoanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChosenLoanPageViewModel>.reactive(
      viewModelBuilder: () => getIt<ChosenLoanPageViewModel>(),
      onModelReady: (model) => model.findUserLoans(),
      builder: (context, model, child) => (model.isBusy)
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(children: [
                                    Text(
                                      'زمان مشخص شده برای هر وام زمان پرداخت وام به شما می باشد',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]);
                                });
                          },
                          icon: Icon(Icons.info),
                          color: Colors.greenAccent.shade700,
                          iconSize: 35,
                        ),
                        Text(
                          'وام های اخذ شده ',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      height: 10,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff00C5AD),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.seperatedLoans.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      model.seperatedLoans[index].name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      model.dateTimes[index].toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: RaisedButton(
                          color: Color(0xff00C5AD),
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
            ),
    );
  }
}
