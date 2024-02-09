import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchToken {
  static Future<String?> registerUser() async {
    const String baseUrl = 'https://reqres.in';
    const String endpoint = '/api/register';

    Map<String, String> requestBody = {
      "email": "eve.holt@reqres.in",
      "password": "pistol"
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        body: json.encode(requestBody),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);

        final Map<String, dynamic> responseData = json.decode(response.body);

        final String? token = responseData['token'];

        return token.toString();
      } else {
       
        return "";
      }
    } catch (e) {
      print('Error while registering user: $e');
      return null;
    }
  }
}
