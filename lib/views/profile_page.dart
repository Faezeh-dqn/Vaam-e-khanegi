import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vaam_khanegi/viewmodels/profile_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

import '../service_locator.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilePageViewModel>.reactive(
      viewModelBuilder: () => getIt<ProfilePageViewModel>(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => (model.isBusy)
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 240, top: 30),
                        child: Text(
                          ' پروفایل',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                        color: Color(0xffB7006E),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      ClipOval(
                        child: SizedBox(
                            width: 150,
                            height: 150,
                            child: model.imagePath == null
                                ? Image.asset('images/no_pic.png')
                                : Image.network(model.imagePath)),
                      ),
                      TextButton(
                        onPressed: () {
                          model.uploadPic();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Text(
                            '  انتخاب و ویرایش عکس',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                'نام  :',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 255,
                                child: TextField(
                                  controller: TextEditingController(
                                      text: model.firstName),
                                  onChanged: (value) {
                                    model.firstName = value;
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Color(0xffB7006E)),
                                    ),
                                    hintText: 'نام',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'نام خانوادگی :',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 255,
                                child: TextField(
                                  controller: TextEditingController(
                                      text: model.retrivedUser.lastName),
                                  onChanged: (value) {
                                    model.lastName = value;
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Color(0xffB7006E)),
                                    ),
                                    hintText: 'نام خانوادگی',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                              ),
                              Text(
                                'ایمیل :',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 33),
                                child: GestureDetector(
                                  onTap: () {
                                    showTopSnackBar(
                                      context,
                                      CustomSnackBar.info(
                                        message: 'ایمیل قابل ویرایش نیست ',
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 255,
                                    child: TextField(
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                      enabled: false,
                                      enableInteractiveSelection: false,
                                      controller: TextEditingController(
                                          text: model.email),
                                      onChanged: (value) {
                                        model.email = value;
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.black),
                                        ),
                                        hintText: 'ایمیل',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
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
                              color: Color(0xffB7006E),
                              onPressed: () async {
                                await model.updateUser();

                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    message: 'اطلاعات شما با موفقیت ثبت شد',
                                  ),
                                );

                                await Get.to(() => MenuPage());
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
                              color: Colors.green,
                              onPressed: () async {
                                await model.updateUser();
                                // ignore: await_only_futures
                                await showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    message: 'اطلاعات شما با موفقیت ثبت شد',
                                  ),
                                );

                                await Get.to(() => MenuPage());
                              },
                              child: Text(
                                'ثبت',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
