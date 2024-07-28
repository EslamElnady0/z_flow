import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

SnackBar buildCustomSnackBar(
    {required String message, bool isError = false, BuildContext? context}) {
  return SnackBar(
    padding: EdgeInsets.zero,
    elevation: 0,
    content: Container(
      width: 375.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: Constants.buildCustomSnackBarGradient(isError
              ? ColorManager.customItemsFailureSnackBarGradientColors
              : ColorManager.customItemsSuccussSnackBarGradientColors)),
      child: Text(
        message,
        style: Styles.style14w400
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.r)),
  );
}
