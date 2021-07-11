import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/viewmodels/withdraw_page_viewmodel.dart';

import '../service_locator.dart';

class withDrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WithdrawPageViewModel>.reactive(
        viewModelBuilder: () => getIt<WithdrawPageViewModel>(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Row(
                          children: [Text('')],
                        );
                      }),
                    )
                  ],
                ),
              ),
            ));
  }
}
