import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stacked/stacked.dart';

import 'package:vaam_khanegi/models/member.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/viewmodels/members_page_viewmodel.dart';
import 'package:vaam_khanegi/views/add_member_form.dart';
import 'package:vaam_khanegi/views/menu_page.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MembersPageViewModel>.reactive(
      viewModelBuilder: () => getIt<MembersPageViewModel>(),
      onModelReady: (model) => model.getMembers(),
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
                        Navigator.pop(context);
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
                  itemCount: model.members.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        MemberCard(
                          member: model.members[index],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Get.to(AddMemberForm());
          },
          child: Icon(
            Icons.add,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final Member member;
  const MemberCard({@required this.member});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${member.name}  ${member.lastname}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
