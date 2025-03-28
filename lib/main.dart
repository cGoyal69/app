import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/form_screen.dart';
import 'screens/response_screen.dart';
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
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
        Provider<UserRepository>(
          create: (context) => UserRepository(
            apiService: context.read<ApiService>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'User Registration',
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/response': (context) => ResponseScreen(),
        },
      ),
    );
  }
}
