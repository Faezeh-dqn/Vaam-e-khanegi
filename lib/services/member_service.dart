import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:vaam_khanegi/models/member.dart';
import 'package:vaam_khanegi/services/auth_service.dart';

class MemberService {
  final AuthService authService;
  MemberService({@required this.authService});

  Future<void> addMember(Member member) async {
    try {
      Uri uri = Uri.http(baseUrl, '/api/member');

      Response response = await http.post(
        uri,
        body: member.toJson(),
        headers: {
          'Authorization': 'Bearer ${authService.authToken}',
        },
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Member>> getMembers() async {
    List<Member> members;
    Uri uri = Uri.http(baseUrl, '/api/member');
    Response response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ${authService.authToken}',
      },
    );
    List list = jsonDecode(response.body);
    members = list.map((json) => Member.fromJson(json)).toList();
    return members;
  }

  Future<void> deleteMember(Member member) async {
    Uri uri = Uri.http(baseUrl, '/api/member');
    await http.delete(uri, body: {'id': '${member.id}'});
  }
}
