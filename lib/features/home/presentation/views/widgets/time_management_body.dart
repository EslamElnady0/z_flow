import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/image_switcher.dart';

import 'text_switcher.dart';

class TimeManagementBody extends StatelessWidget {
  const TimeManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          Text(
            AppTexts.hereYouCanFindOutYourTime,
            style: Styles.style16W600grey,
          ),
          SizedBox(
            height: 20.h,
          ),
          const TextSwitcher(),
          SizedBox(
            height: 20.h,
          ),
          const ImageSwitcher(),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            text: AppTexts.timeOfUse,
            gradient: Constants.customButtonGradient,
            style: Styles.style27W600,
            height: 66.h,
            raduis: 18.r,
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(
            text: AppTexts.limitationsOfUse,
            gradient: Constants.customButtonGradient,
            style: Styles.style27W600,
            height: 66.h,
            raduis: 18.r,
          ),
        ],
      ),
    );
  }
}
