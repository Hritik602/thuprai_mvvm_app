import 'package:flutter/material.dart';
import 'package:thuprai_mvvm_test/core/color/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.lightBlack),
          titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.lightBlack),
          titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.lightBlack),
          bodyLarge: TextStyle(fontSize: 16, color: AppColors.lightBlack),
          bodyMedium: TextStyle(fontSize: 14, color: AppColors.lightBlack),
          bodySmall: TextStyle(fontSize: 12, color: AppColors.lightBlack)),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
          titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.white),
          titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.white),
          bodyLarge: TextStyle(fontSize: 16, color: AppColors.white),
          bodyMedium: TextStyle(fontSize: 14, color: AppColors.white),
          bodySmall: TextStyle(fontSize: 12, color: AppColors.white)),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBlack,
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))));
}
