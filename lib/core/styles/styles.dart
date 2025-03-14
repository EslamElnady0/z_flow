import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';

class Styles {
  static TextStyle style16W600grey = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );
  static TextStyle style16W500grey = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static TextStyle style16W400white = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle style24W600 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle style26W600 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle style27W600 = TextStyle(
    fontSize: 27.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle style20W700white = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle style20W600 = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle style22W600 = TextStyle(
      fontSize: 22.sp, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle style20W500 = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.black);
  static TextStyle style34W700blue = TextStyle(
      fontSize: 34.sp,
      fontWeight: FontWeight.w700,
      shadows: [
        Shadow(
            offset: const Offset(0, 4),
            blurRadius: 18.5,
            color: const Color(0xff0B3F7D).withOpacity(0.25))
      ],
      color: ColorManager.primaryColor);
  static TextStyle style10w600 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle style14w400 = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.grey);
  static TextStyle style15w400 = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.grey);
  static TextStyle style12w600grey = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xffC8C8C8));
  static TextStyle style12w600 = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle style12w400grey = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.grey);
  static TextStyle style18w600 = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle style18w500 = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.grey);
  static TextStyle style32w700 = TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle style40w700 = TextStyle(
      fontSize: 40.sp, fontWeight: FontWeight.w700, color: Colors.white);
}
