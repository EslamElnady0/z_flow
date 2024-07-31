import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

class WorkSessionTimeContainer extends StatelessWidget {
  final String text;
  const WorkSessionTimeContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 140.h,
      decoration: BoxDecoration(
          gradient: Constants.customButtonGradient,
          borderRadius: BorderRadius.circular(8.r)),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.style32w700,
        ),
      ),
    );
  }
}
