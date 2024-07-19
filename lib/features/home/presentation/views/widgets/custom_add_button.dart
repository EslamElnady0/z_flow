import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';

class CustomAddButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CustomAddButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 56.h,
        width: 247.w,
        decoration: BoxDecoration(
          gradient: Constants.customItemsGradient,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              Assets.addIcon,
              height: 24.h,
              width: 24.w,
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
