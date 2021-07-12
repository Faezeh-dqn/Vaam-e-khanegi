import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/installments_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

import '../service_locator.dart';

class InstallmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InstallmentPageViewModel>.reactive(
      viewModelBuilder: () => getIt<InstallmentPageViewModel>(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 260, top: 23),
                child: Text(
                  'اقساط ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                ),
              ),
              Divider(
                thickness: 1,
                height: 10,
                indent: 10,
                endIndent: 10,
                color: Color(0xff69CA2E),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.installments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                            elevation: 0,
                            color: Color(0xff69CA2E),
                            onPressed: () {},
                            child: Text('اقساط',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              model.installments[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                    color: Color(0xff69CA2E),
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
