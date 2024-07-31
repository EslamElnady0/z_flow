import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';

class CustomPausePlayButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isPaused;
  const CustomPausePlayButton(
      {super.key, required this.onTap, required this.isPaused});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 70.w,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.15))
            ]),
        child: SvgPicture.asset(
          isPaused ? Assets.playIcon : Assets.pauseIcon,
        ),
      ),
    );
  }
}
