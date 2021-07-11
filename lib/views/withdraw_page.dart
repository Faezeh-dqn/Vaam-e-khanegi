import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/withdraw_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

import '../service_locator.dart';

class withDrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WithdrawPageViewModel>.reactive(
        viewModelBuilder: () => getIt<WithdrawPageViewModel>(),
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
                        'برداشت ها',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
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
                        itemCount: model.withdraw.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: 180,
                              ),
                              Text(
                                'برداشتی :   ${model.withdraw[index].amount} میلیون تومان',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
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
