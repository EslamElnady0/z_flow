import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/generate_platform_logo.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/launch_url.dart';

import '../../../../core/styles/styles.dart';

class CustomLinkChip extends StatelessWidget {
  final String url;
  const CustomLinkChip({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchLinkUrl(url);
      },
      child: IntrinsicWidth(
        child: Container(
          constraints: BoxConstraints(maxWidth: 0.6.sw),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
          decoration: BoxDecoration(
              color: ColorManager.chipBackground,
              borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            children: [
              SvgPicture.asset(
                getPlatformLogo(
                  url,
                ),
                height: 16.h,
                width: 16.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              Flexible(
                child: Text(
                  url,
                  style: Styles.style14w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
