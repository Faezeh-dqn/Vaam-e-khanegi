import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vaam_khanegi/models/loan.dart';
import 'package:vaam_khanegi/viewmodels/loan_page_viewModel.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import '../service_locator.dart';

class LoanPage extends StatefulWidget {
  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoanPageViewModel>.reactive(
      viewModelBuilder: () => getIt<LoanPageViewModel>(),
      onModelReady: (model) => model.getLoansFromDB(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 250, top: 23),
                    child: Text(
                      'وام ها',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 10,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.retrivedLoans.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ExpansionPanelList(
                              elevation: 1,
                              expansionCallback: (int index, bool isExpanded) {
                                bool x = model.active;
                                x = !x;
                                model.seteActive(x);

                                setState(() {});
                              },
                              children: [
                                ExpansionPanel(
                                  isExpanded: model.active,
                                  backgroundColor: Colors.grey.shade200,
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        model.retrivedLoans[index].name,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    );
                                  },
                                  body: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 2,
                                          ),
                                          RaisedButton(
                                            elevation: 0,
                                            color: Colors.amber,
                                            onPressed: () {
                                              setState(() {
                                                showLoanMembersDialog(
                                                    context, model, index);
                                              });
                                            },
                                            child: Text('شرکت کنندگان',
                                                style:
                                                    PersianFonts.Vazir.copyWith(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          RaisedButton(
                                            elevation: 0,
                                            color: Color(0xffFF993A),
                                            onPressed: () {},
                                            child: Text('اخذ',
                                                style:
                                                    PersianFonts.Vazir.copyWith(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          RaisedButton(
                                            elevation: 0,
                                            color: Colors.green.shade400,
                                            onPressed: () {
                                              setState(
                                                () {
                                                  showDetailsDialog(
                                                      context, model, index);
                                                },
                                              );
                                            },
                                            child: Text('جزئیات',
                                                style:
                                                    PersianFonts.Samim.copyWith(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 650, left: 115),
                child: Container(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    elevation: 0,
                    color: Color(0xffFF993A),
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
      ),
    );
  }

  Future<dynamic> showLoanMembersDialog(
      BuildContext context, LoanPageViewModel model, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Padding(
            padding: EdgeInsets.only(left: 80),
            child: Text(
              'شرکت کنندگان وام',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 60, bottom: 10),
              child: Text(
                'آمار شرکت کنندگان : ${model.retrivedLoans[index].joinedMembers.length}/${model.retrivedLoans[index].requierdMembers}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SimpleDialogOption(
              child: Container(
                width: 10,
                height: 40,
                color: Colors.blue.shade900,
                child: Padding(
                  padding: EdgeInsets.only(left: 75, top: 5),
                  child: Text(
                    'اعضای وام',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Padding(
                          padding: EdgeInsets.only(left: 180),
                          child: Text(
                            'اعضای وام',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(
                              ' ${model.retrivedLoans[index].joinedMembers.toString()}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            SimpleDialogOption(
              child: Container(
                width: 10,
                height: 40,
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.only(left: 80, top: 5),
                  child: Text(
                    'عضویت',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                model.seteJoinedMembers(
                    model.retrivedLoans[index].joinedMembers.length++);
                Navigator.pop(context);
                showTopSnackBar(
                  context,
                  CustomSnackBar.success(
                    message: 'عضویت شما ثبت شد ',
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }

  Future<dynamic> showDetailsDialog(
      BuildContext context, LoanPageViewModel model, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Padding(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                'جزئیات',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DialogItems(
                    onvan: 'عنوان وام :${model.retrivedLoans[index].name}',
                  ),
                  DialogItems(
                    onvan:
                        'مقدار وام :${model.retrivedLoans[index].amount.toString()}',
                  ),
                  DialogItems(
                    onvan:
                        'تعداد اعضا مورد نیاز :${model.retrivedLoans[index].requierdMembers}',
                  ),
                  DialogItems(
                    onvan: 'توضیحات:${model.retrivedLoans[index].description}',
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'متوجه شدم',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}

class DialogItems extends StatelessWidget {
  String onvan;
  DialogItems({@required this.onvan});

  @override
  Widget build(BuildContext context) {
    return Text(
      onvan,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}
