import 'package:flutter/material.dart';
import 'package:thuprai_mvvm_test/core/theme/app_theme.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/view/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: const SignUp());
  }
}
