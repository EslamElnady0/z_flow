import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';

import '../../../core/styles/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String hintText;
  const CustomSearchTextField({
    super.key,
    this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorManager.primaryColor,
      style: Styles.style18w500.copyWith(color: Colors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 24.r,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: Styles.style18w500,
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Colors.transparent))),
    );
  }
}
