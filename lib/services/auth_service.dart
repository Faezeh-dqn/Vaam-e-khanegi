import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const String baseUrl = 'loan.shaghayeghschool.ir';

class AuthService {
  String authToken;
  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      Uri uri = Uri.http(baseUrl, '/api/register');
      Map<String, dynamic> data = {
        'name': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };
      print(data);
      Response response = await http.post(uri, body: data);
      if (response.statusCode != 200) {
        throw UnknownException();
      }
    } on UnknownException {
      rethrow;
    }
  }

  Future<void> singIn(String email, String password) async {
    try {
      Uri uri = Uri.http(baseUrl, '/api/login');
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };
      Response response = await http.post(uri, body: data);
      if (response.statusCode == 401) {
        throw InvalidEmailOrPassword();
      }
      Map<String, dynamic> map = jsonDecode(response.body);
      authToken = map['date']['token'];
    } on InvalidEmailOrPassword {
      rethrow;
    } catch (e) {
      throw UnknownException();
    }
  }
}

class InvalidEmailOrPassword implements Exception {
  @override
  String toString() {
    // TODO: implement toString
    return 'ایمیل یا پسورد اشتباه است';
  }
}

class UnknownException implements Exception {
  @override
  String toString() {
    // TODO: implement toString
    return 'خطای غیر منتظره رخ داد';
  }
}
