import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

class CustomManageListButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomManageListButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 7.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: Constants.customButtonGradient),
          child: Text(
            AppTexts.manage,
            style: Styles.style16W600grey.copyWith(color: Colors.white),
          )),
    );
  }
}
