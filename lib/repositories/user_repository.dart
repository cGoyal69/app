import '../remote/api_service.dart';
import '../models/user_model.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<Map<String, dynamic>> registerUser(UserModel user) async {
    return await apiService.submitUser(user);
  }
}
