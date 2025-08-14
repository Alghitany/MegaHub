import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> register(Map<String, dynamic> body) async {
    final url = Uri.parse('http://megahubproject.runasp.net/api/Auth/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return "Registration Successful";
      } else {
        return data['message'] ?? 'Registration failed';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
