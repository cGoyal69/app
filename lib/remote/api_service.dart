import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';

class ApiService {
  static const baseUrl = 'http://10.0.2.2:3000/api/users/register';

  Future<Map<String, dynamic>> submitUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return {
          'success': true,
          'data': UserModel.fromJson(responseBody['data']),
          'message': responseBody['message'] ?? 'User registered successfully!'
        };
      } else {
        return {
          'success': false,
          'message': responseBody['message'] ?? 'Failed to register user',
          'errors': responseBody['errors']
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}'
      };
    }
  }
}