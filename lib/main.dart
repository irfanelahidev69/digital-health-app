import 'package:digital_health_app/core/app_theme/app_theme.dart';
import 'package:digital_health_app/features/auth/pages/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Health App',
      theme: AppTheme().lightTheme,
      home: const LoginScreen(),
    );
  }
}
