import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vaam_khanegi/viewmodels/installments_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

import '../service_locator.dart';

class InstallmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InstallmentPageViewModel>.reactive(
      viewModelBuilder: () => getIt<InstallmentPageViewModel>(),
      onModelReady: (model) => model.getInstallments(),
      builder: (context, model, _) => Scaffold(
        body: Center(
            child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 260, top: 10),
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
                    itemCount: model.installments1.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              elevation: 0,
                              color: (model.installments1[index].status ==
                                      'پرداخت نشده')
                                  ? Color(0xff69CA2E)
                                  : model.color,
                              child: Text(
                                'پرداخت',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                (model.installments1[index].status ==
                                        'پرداخت نشده')
                                    ? showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            title: Padding(
                                              padding: EdgeInsets.only(
                                                left: 65,
                                              ),
                                              child: Text(
                                                'اعضای وام',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 100),
                                                child: Text(
                                                  model.installments1[index]
                                                      .name,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 50),
                                                child: Text(
                                                  'مبلغ وام : ${model.installments1[index].amount.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 40),
                                                child: Text(
                                                  model.formatShamsiDate(model
                                                      .installments1[index]
                                                      .dueDate),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 40),
                                                child: Text(
                                                  'وضعیت : ${model.installments1[index].status}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SimpleDialogOption(
                                                child: Container(
                                                  height: 50,
                                                  width: 100,
                                                  color: Color(0xff69CA2E),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 80, top: 4),
                                                    child: Text(
                                                      'پرداخت',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  await model.updateStatus(
                                                      'پرداخت شد',
                                                      model.installments1[
                                                          index]);

                                                  // await model.getInstallments();
                                                  await model.setColor(
                                                      Colors.grey.shade400);

                                                  showTopSnackBar(
                                                    context,
                                                    CustomSnackBar.success(
                                                      message:
                                                          'قسط با موفقیت پرداخت شد ',
                                                    ),
                                                  );

                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          );
                                        },
                                      )
                                    : showTopSnackBar(
                                        context,
                                        CustomSnackBar.info(
                                          message: 'این قسط پرداخت شده ',
                                        ),
                                      );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                model.installments1[index].name,
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
                      elevation: 0,
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
          ],
        )),
      ),
    );
  }
}
