import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';

import '../../../../core/styles/styles.dart';

class CustomLinkChip extends StatelessWidget {
  const CustomLinkChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
          color: ColorManager.chipBackground,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          Text(
            "www.example.com",
            style: Styles.style14w400,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
