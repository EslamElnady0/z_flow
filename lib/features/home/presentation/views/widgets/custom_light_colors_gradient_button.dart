import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';

class CustomLightColorsGradientButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String icon;
  const CustomLightColorsGradientButton(
      {super.key, this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          gradient: Constants.customItemsGradient,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.playIcon,
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: Styles.style24W600,
            )
          ],
        ),
      ),
    );
  }
}