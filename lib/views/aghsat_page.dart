import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/aghsat_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import 'package:vaam_khanegi/views/pardakhtEghest_page.dart';

import '../service_locator.dart';

class AghsatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AghsatPageViewModel>.reactive(
      viewModelBuilder: () => getIt<AghsatPageViewModel>(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text(
                            ' تاریخچه پرداخت',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: (model.active1)
                                    ? Colors.white
                                    : Colors.grey.shade400,
                                fontSize: 23),
                          ),
                          onPressed: () {
                            model.setActive1(false);
                            model.setActive2(true);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          child: Text(
                            'پرداخت قسط ',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: (model.active2 == false)
                                    ? Colors.grey.shade400
                                    : Colors.white,
                                fontSize: 23),
                          ),
                          onPressed: () {
                            model.setActive2(false);
                            model.setActive1(true);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => PghetPage()),
                            );
                          },
                        )
                      ],
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
                    color: Colors.green,
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
}
