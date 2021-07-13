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
      onModelReady: (model) => model.getLoansFromGlobalState(),
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
                    color: Color(0xffFF993A),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.retrivedLoans.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    child: Text(
                                      'بیشتر',
                                      style: TextStyle(
                                          color: Colors.green.shade500,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              children: [
                                                SimpleDialogOption(
                                                  child: Container(
                                                    color: Colors.green,
                                                    height: 50,
                                                    width: 100,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 80, top: 6),
                                                      child: Text(
                                                        'جزئیات',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    showDetailsDialog(
                                                        context, model, index);
                                                  },
                                                ),
                                                SimpleDialogOption(
                                                  child: Container(
                                                    width: 100,
                                                    height: 50,
                                                    color: Colors.amber,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 90, top: 7),
                                                      child: Text(
                                                        'اعضا',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return SimpleDialog(
                                                          title: Text(
                                                            'اعضای وام',
                                                            style: TextStyle(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          children: [
                                                            (model
                                                                        .retrivedLoans[
                                                                            index]
                                                                        .joinedMemberFullName ==
                                                                    null)
                                                                ? Text(
                                                                    'تا کنون کسی عضو این وام نشده :(')
                                                                : Text(
                                                                    '${model.retrivedLoans[index].joinedMemberFullName.length}/${model.retrivedLoans[index].requierdMembers}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                            (model
                                                                        .retrivedLoans[
                                                                            index]
                                                                        .joinedMemberFullName ==
                                                                    null)
                                                                ? Text(
                                                                    '0/${model.retrivedLoans[index].requierdMembers}')
                                                                : Text(
                                                                    model
                                                                        .retrivedLoans[
                                                                            index]
                                                                        .joinedMemberFullName
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                                SimpleDialogOption(
                                                  child: Container(
                                                    height: 50,
                                                    width: 100,
                                                    color: Color(0xffFF993A),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 80, top: 4),
                                                      child: Text(
                                                        'عضویت',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return SimpleDialog(
                                                          title: Text(
                                                            'آیا می خواهید عضو این وام شوید؟',
                                                            style: TextStyle(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 170,
                                                                ),
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                    'خیر',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            23,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade600),
                                                                  ),
                                                                ),
                                                                TextButton(
                                                                  onPressed:
                                                                      () async {
                                                                    var x = num.parse(model
                                                                        .retrivedLoans[
                                                                            index]
                                                                        .requierdMembers);

                                                                    if (model
                                                                            .retrivedLoans[index]
                                                                            .joinedMemberFullName
                                                                            .length <=
                                                                        x) {
                                                                      await model
                                                                          .getUserName(
                                                                              model.retrivedLoans[index]);
                                                                      await model.updateJoinedMember(
                                                                          model.retrivedLoans[
                                                                              index],
                                                                          model
                                                                              .joinedMembers);
                                                                      await showTopSnackBar(
                                                                        context,
                                                                        CustomSnackBar
                                                                            .success(
                                                                          message:
                                                                              'وام با موفقیت ثبت شد ',
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      showTopSnackBar(
                                                                        context,
                                                                        CustomSnackBar
                                                                            .error(
                                                                          message:
                                                                              'ظرفیت این وام پر شده است ',
                                                                        ),
                                                                      );
                                                                    }

                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                    'بله',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            23,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .green),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                  Text(
                                    model.retrivedLoans[index].name,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
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
                      print('length is${model.retrivedLoans.length}');
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
