import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:stacked/stacked.dart';
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
              body: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.loans.length,
                        itemBuilder: (context, index) {
                          return ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {},
                            children: [
                              ExpansionPanel(
                                isExpanded: true,
                                backgroundColor: Colors.grey.shade200,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text(
                                      model.loans[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                },
                                body: Column(
                                  children: [
                                    Text(model.loans[index].description,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    Text(
                                        'مقدار وام : ${model.loans[index].amount.toString()}میلیون تومان',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                    Text(
                                        'تعداد اقساط : ${model.loans[index].installments.toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                    Text(
                                        'تعداد شرکت کننده مورد نیاز : ${model.loans[index].requierdMembers.toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 60, left: 110),
                          child: Container(
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 50),
                          child: FloatingActionButton(
                            backgroundColor: Colors.purpleAccent.shade400,
                            child: Icon(Icons.add),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.purple.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context) => Container(
                                  height: 500,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        width: 300,
                                        height: 50,
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: 'عنوان وام',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            model.setName(value);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 300,
                                        height: 50,
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: 'مقدار وام',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            model.setAmount(value);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 300,
                                        height: 50,
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: 'تعداد اقساط',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            model.setInstallments(value);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 300,
                                        height: 50,
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: 'تعداد اعضای مورد نیاز',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            model.setRequierdMembers(value);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
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
                                            'ثبت وام',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
            ));
  }
}
