import 'package:digital_health_app/core/app_theme/app_theme.dart';
import 'package:digital_health_app/core/bloc/authentication/authentication_bloc.dart';
import 'package:digital_health_app/core/firebase/firestore_handler.dart';
import 'package:digital_health_app/features/auth/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FireStoreHandler();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Health App',
        theme: AppTheme().lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
