import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../../../../core/constants/constants.dart';

class CustomBottomDialogAction extends StatelessWidget {
  const CustomBottomDialogAction(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.text,
      this.gradient,
      this.color});
  final VoidCallback onTap;
  final String icon;
  final Gradient? gradient;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                width: 57.w,
                height: 57.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  gradient: gradient ?? Constants.customItemsGradient,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  icon,
                  color: color,
                )),
          ),
          SizedBox(height: 10.h),
          Text(
            text,
            style: Styles.style14w400
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
