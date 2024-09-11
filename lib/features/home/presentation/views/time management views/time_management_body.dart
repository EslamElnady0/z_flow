import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/image_switcher.dart';

import '../widgets/text_switcher.dart';

class TimeManagementBody extends StatelessWidget {
  const TimeManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          Text(
            S.of(context).hereYouCanFindOutYourTime,
            style: Styles.style16W600grey,
          ),
          SizedBox(
            height: 20.h,
          ),
          const TextSwitcher(),
          SizedBox(
            height: 20.h,
          ),
          ImageSwitcher(
            switchingImages: Constants.switchingTimeManagementImages,
            height: 296.h,
          ),
          SizedBox(
            height: 90.h,
          ),
          CustomButton(
            text: S.of(context).timeOfUse,
            gradient: Constants.customButtonGradient,
            onTap: () {
              Navigator.pushNamed(context, AppRouter.timeOfUse);
            },
            style: Styles.style27W600,
            height: 66.h,
            raduis: 18.r,
          ),
          SizedBox(
            height: 30.h,
          ),
          // CustomButton(
          //   text: S.of(context).limitationsOfUse,
          //   gradient: Constants.customButtonGradient,
          //   style: Styles.style27W600,
          //   height: 66.h,
          //   raduis: 18.r,
          // ),
        ],
      ),
    );
  }
}
