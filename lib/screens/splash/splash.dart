import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuprai_mvvm_test/utils/app_image.dart';
import 'package:thuprai_mvvm_test/utils/app_routes.dart';
import 'package:thuprai_mvvm_test/utils/cache_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isUserLogin;
  @override
  void initState() {
    super.initState();
    getUserLoginStatus();
    Timer(const Duration(seconds: 2), () {
      _navigation();
    });
  }

  getUserLoginStatus() async {
    isUserLogin = await CacheService.isUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 1.sw,
              height: 0.05.sh,
              child: SvgPicture.asset(
                AppImage.thupraiAppLogo,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigation() {
    if (!isUserLogin) {
      Navigator.pushReplacementNamed(context, AppRoute.signInRoute);
    } else {
      Navigator.pushReplacementNamed(context, AppRoute.homeRoute);
    }
  }
}
