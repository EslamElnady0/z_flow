import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';

class CustomAuthTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool? isPassword;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomAuthTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword,
    required this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      obscureText: isPassword ?? false,
      cursorColor: Colors.white,
      style: Styles.style16W500grey.copyWith(color: Colors.white),
      decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 12.sp),
          suffixIcon: Icon(
            icon,
            size: 22.r,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16.sp),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          border: Constants.textFieldBorder,
          focusedBorder: Constants.textFieldBorder,
          enabledBorder: Constants.textFieldBorder),
    );
  }
}
