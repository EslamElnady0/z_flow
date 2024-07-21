import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/styles/styles.dart';

SnackBar buildCustomSnackBar(
    {required String message, Color? backgroundColor}) {
  return SnackBar(
    content: Text(
      message,
      style: Styles.style14w400
          .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
    ),
    backgroundColor: backgroundColor ?? ColorManager.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
  );
}
