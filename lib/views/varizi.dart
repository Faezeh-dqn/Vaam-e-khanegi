import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/varizi_page_viewModel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import 'package:vaam_khanegi/views/vaam.dart';

import '../service_locator.dart';

class VariziPage extends StatefulWidget {
  @override
  _VariziPageState createState() => _VariziPageState();
}

class _VariziPageState extends State<VariziPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VariziPageViewModel>.reactive(
        viewModelBuilder: () => getIt<VariziPageViewModel>(),
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
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text(
                                                    model.description,
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                )
                                              ],
                                            );
                                          });
                                    });
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    ' مبلغ واریزی :${model.amount} تومان',
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
                              color: Colors.green.shade600,
                              onPressed: () {
                                Get.to(() => MenuPage());
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
