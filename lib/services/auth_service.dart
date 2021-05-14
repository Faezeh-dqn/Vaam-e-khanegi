import 'package:http/http.dart' as http;

const String baseUrl = 'localhost:8000';

class AuthService {
  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      Uri uri = Uri.http(baseUrl, '/api/register');
      Map<String, dynamic> data = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };
      await http.post(uri, body: data);
    } catch (e) {}
  }

  Future<void> singIn(String email, String password) async {
    try {
      Uri uri = Uri.http(baseUrl, '/api/login');
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };
      await http.post(uri, body: data);
    } catch (e) {}
  }
}
