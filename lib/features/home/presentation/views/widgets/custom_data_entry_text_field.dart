import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';

class CustomDataEntryTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final bool? isPassword;
  final int? minLines;
  final void Function()? onTap;
  final int? maxLines;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const CustomDataEntryTextField({
    super.key,
    required this.hintText,
    this.minLines,
    required this.icon,
    this.onTap,
    this.isPassword,
    required this.controller,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return "This field is required";
            } else {
              return null;
            }
          },
      onTap: onTap,
      controller: controller,
      obscureText: isPassword ?? false,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      cursorColor: Colors.white,
      style: Styles.style16W500grey.copyWith(color: Colors.white),
      decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 12.sp),
          suffixIcon: icon,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 40.h,
            maxWidth: 40.w,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16.sp),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          border: Constants.dataEntryTextFieldBorder,
          focusedBorder: Constants.authTextFieldBorder,
          enabledBorder: Constants.dataEntryTextFieldBorder),
    );
  }
}
