// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:thuprai_mvvm_test/core/color/app_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onTap,
    this.buttonText,
  }) : super(key: key);
  final Function()? onTap;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(width: 0.0, color: AppColors.lightBlack),
            borderRadius: BorderRadius.circular(20)),
        width: 1.sw,
        height: 0.06.sh,
        child: Center(
            child: Text(buttonText ?? "Click",
                style: TextStyle(color: AppColors.white))),
      ),
    );
  }
}
