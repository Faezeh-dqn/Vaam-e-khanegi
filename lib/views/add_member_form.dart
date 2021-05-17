import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/viewmodels/add_member_form_viewmodel.dart';
import 'package:vaam_khanegi/views/custom_textfield.dart';

class AddMemberForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddMemberFormViewModel>.reactive(
      viewModelBuilder: () => getIt<AddMemberFormViewModel>(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'اضافه کردن عضو',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: model.name,
                  label: 'نام',
                ),
                CustomTextField(
                  controller: model.lastname,
                  label: 'نام خانوادگی',
                ),
                CustomTextField(
                  controller: model.fatherName,
                  label: 'نام پدر',
                ),
                CustomTextField(
                  controller: model.birthdate,
                  label: 'تاریخ تولد',
                ),
                CustomTextField(
                  controller: model.ssn,
                  label: 'کد ملی',
                ),
                CustomTextField(
                  controller: model.telephone,
                  label: 'شماره منزل',
                ),
                CustomTextField(
                  controller: model.phoneNumber,
                  label: 'شماره همراه',
                ),
                CustomTextField(
                  controller: model.address,
                  label: 'آدرس',
                ),
                CustomTextField(
                  controller: model.accountNumber,
                  label: 'شماره حساب',
                ),
                CustomTextField(
                  controller: model.creditCard,
                  label: 'شماره کارت',
                ),
                CustomTextField(
                  controller: model.money,
                  label: 'موجودی',
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    model.addMember();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'اضافه',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
