import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/aza_page_viewmodel.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

class AzaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AzaPageViewModel>.reactive(
      viewModelBuilder: () => AzaPageViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 30),
                    child: IconButton(
                      iconSize: 32,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 230),
                    child: Text(
                      'اعضا',
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
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
                  scrollDirection: Axis.vertical,
                  itemCount: model.user.length,
                  itemBuilder: (context, itemCount) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 270),
                          child: Text(
                            model.user[0],
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
