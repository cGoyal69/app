import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/form_screen.dart';
import 'theme/app_theme.dart';
import 'repositories/user_repository.dart';
import 'remote/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
        Provider<UserRepository>(
          create:
              (context) =>
                  UserRepository(apiService: context.read<ApiService>()),
        ),
      ],
      child: MaterialApp(
        title: 'User Registration',
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}

// lib/app/data/models/user_model.dart
class UserModel {
  final String name;
  final String email;
  final String phone;

  UserModel({required this.name, required this.email, required this.phone});

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json['name'], email: json['email'], phone: json['phone']);
}
