import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/deposit_page_viewModel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import 'package:vaam_khanegi/views/loan.dart';

import '../service_locator.dart';

class VariziPage extends StatefulWidget {
  @override
  _VariziPageState createState() => _VariziPageState();
}

class _VariziPageState extends State<VariziPage> {
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
                            return Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                RaisedButton(
                                  elevation: 0,
                                  color: Color(0xff4221C6),
                                  child: Text(
                                    'توضیحات',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              title: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 80),
                                                child: Text(
                                                  'توضیحات',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              children: <Widget>[
                                                Text(
                                                  model.deposits[index]
                                                      .description,
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )
                                              ],
                                            );
                                          });
                                    });
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    ' مبلغ واریزی :${model.deposits[index].amount} تومان',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 60),
                          child: Container(
                            height: 50,
                            width: 150,
                            child: RaisedButton(
                              elevation: 0,
                              color: Colors.blue.shade600,
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.blue.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
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
                                              hintText: 'مبلغ واریزی',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onChanged: (value) {},
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
                                              hintText: 'توضیحات',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onChanged: (value) {},
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
                                            color: Colors.blue.shade600,
                                            onPressed: () {
                                              Get.to(() => MenuPage());
                                            },
                                            child: Text(
                                              'ثبت واریز',
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
                              child: Text(
                                'واریزی جدید',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
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
