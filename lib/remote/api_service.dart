import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<Map<String, dynamic>> submitUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': UserModel.fromJson(jsonDecode(response.body)),
          'message': 'User registered successfully!',
        };
      } else {
        return {
          'success': false,
          'message':
              'Failed to register user. Status code: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: ${e.toString()}'};
    }
  }
}
