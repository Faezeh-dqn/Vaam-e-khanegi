import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vaam_khanegi/viewmodels/createLoan_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

import '../service_locator.dart';

class CreateLoanPage extends StatefulWidget {
  @override
  _CreateLoanPageState createState() => _CreateLoanPageState();
}

class _CreateLoanPageState extends State<CreateLoanPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateLoanPageViewModel>.reactive(
        viewModelBuilder: () => getIt<CreateLoanPageViewModel>(),
        builder: (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 210, top: 23),
                        child: Text(
                          'ایجاد وام',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                        color: Color(0xffFF3AEB),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 330,
                            height: 55,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'عنوان وام',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                model.setName(value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 330,
                            height: 55,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'مقدار وام',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                model.setAmount(value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 330,
                            height: 55,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'توضیحات وام',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                model.setDescription(value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 330,
                            height: 55,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'تعداد اعضای مورد نیاز',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                model.setRequierdMembers(value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 130,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                            child: RaisedButton(
                              elevation: 0,
                              color: Color(0xffFF3AEB),
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
                          Container(
                            height: 50,
                            width: 150,
                            child: RaisedButton(
                              elevation: 0,
                              color: Colors.green.shade600,
                              child: Text(
                                'ثبت وام',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              onPressed: () async {
                                await model.createLoan();

                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    message: 'وام با موفقیت ثبت شد ',
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
