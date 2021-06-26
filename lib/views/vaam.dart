import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/vaam_page_viewModel.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:vaam_khanegi/views/menu_page.dart';
import '../service_locator.dart';

class VaamPage extends StatefulWidget {
  @override
  _VaamPageState createState() => _VaamPageState();
}

class _VaamPageState extends State<VaamPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VaamPageViewModel>.reactive(
      viewModelBuilder: () => getIt<VaamPageViewModel>(),
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
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RaisedButton(
                                  color: Color(0xff00DA6B),
                                  onPressed: () {},
                                  child: Text('اخذ',
                                      style: PersianFonts.Vazir.copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                RaisedButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    setState(
                                      () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SimpleDialog(
                                                title: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 80),
                                                  child: Text(
                                                    'جزئیات',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      DialogItems(
                                                        onvan:
                                                            'مقدار وام :${model.meghdarEVaam}',
                                                      ),
                                                      DialogItems(
                                                        onvan:
                                                            'تاریخ اعطای وام :${model.tarikheEtayeVaam}',
                                                      ),
                                                      DialogItems(
                                                        onvan:
                                                            'تاریخ اتمام :${model.tarikheEtmam}',
                                                      ),
                                                      DialogItems(
                                                        onvan:
                                                            'تعداد اقساط :${model.tedadeAghsat}',
                                                      ),
                                                      DialogItems(
                                                        onvan:
                                                            'سر رسید قسط :${model.sarResideVaam}',
                                                      ),
                                                      SimpleDialogOption(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 130,
                                                          height: 40,
                                                          color: Colors.green,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20),
                                                            child: Text(
                                                              'متوجه شدم',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
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
                                      },
                                    );
                                  },
                                  child: Text('جزئیات',
                                      style: PersianFonts.Samim.copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    model.onvaneVaam,
                                    style: TextStyle(fontSize: 21.5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
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
