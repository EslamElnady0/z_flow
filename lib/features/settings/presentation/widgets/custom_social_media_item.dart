import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/constants.dart';

class CustomSocialMediaItem extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const CustomSocialMediaItem(
      {super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(9.r),
          width: 45.w,
          height: 45.h,
          decoration: const BoxDecoration(
            gradient: Constants.customButtonGradient,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            image,
          ),
        ),
      ),
    );
  }
}
