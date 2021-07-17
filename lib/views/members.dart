import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vaam_khanegi/viewmodels/member_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

import '../service_locator.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MemberPageViewModel>.reactive(
        viewModelBuilder: () => getIt<MemberPageViewModel>(),
        onModelReady: (model) => model.getMembers(),
        builder: (context, model, child) => (model.isBusy)
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 160, top: 23),
                        child: Text(
                          'اعضا صندوق ',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                        color: Color(0xffBF0A2A),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.members.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      '${model.members[index].firstName}   ${model.members[index].lastName}',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ClipOval(
                                    child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: model.imagePath == null
                                            ? Image.asset('images/no_pic.png')
                                            : Image.network(
                                                model.imagesPath[index])),
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
                            color: Color(0xffBF0A2A),
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
