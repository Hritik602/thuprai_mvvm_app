import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thuprai_mvvm_test/core/theme/app_theme.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_in/view/sign_in.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/view/sign_up.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/view_model/auth_view_model.dart';
import 'package:thuprai_mvvm_test/screens/home/view/home.dart';
import 'package:thuprai_mvvm_test/screens/home/view_model/home_view_model.dart';
import 'package:thuprai_mvvm_test/screens/splash/splash.dart';
import 'package:thuprai_mvvm_test/utils/app_routes.dart';
import 'package:thuprai_mvvm_test/utils/service_locator.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => serviceLocator.get<AuthViewModel>(),
            ),
            ChangeNotifierProvider(
                create: (_) => serviceLocator.get<HomeViewModel>())
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Thuprai MVVM Test',
              initialRoute: AppRoute.splashRoute,
              routes: {
                AppRoute.splashRoute: (context) => const SplashScreen(),
                AppRoute.signUpRoute: (context) => const SignUp(),
                AppRoute.homeRoute: (context) => const HomeScreen(),
                AppRoute.signInRoute: (context) => const SignIn()
              },
              theme: AppTheme.lightTheme,
              home: const SplashScreen()),
        );
      },
    );
  }
}
