import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';

class ProfileCustomDivider extends StatelessWidget {
  const ProfileCustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          indent: 15.w,
          endIndent: 7.w,
        )),
        Text(
          AppTexts.youCanTrackYourProgress,
          style: Styles.style16W500grey,
        ),
        Expanded(
            child: Divider(
          indent: 7.w,
          endIndent: 15.w,
        ))
      ],
    );
  }
}
