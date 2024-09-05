import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIconWidget extends StatelessWidget {
  final String icon;
  const CustomSvgIconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: SvgPicture.asset(
        icon,
        height: 16.h,
        width: 16.w,
        color: Colors.grey,
      ),
    );
  }
}
