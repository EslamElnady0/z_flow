import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';
import 'custom_settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          Divider(
            height: 2.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            AppTexts.controlAppSettings,
            style: Styles.style14w400,
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CustomSettingsItem(
                model: Constants.settingsItems[index],
                index: index,
                onTap: () {},
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: Constants.settingsItems.length,
            ),
          )
        ],
      ),
    );
  }
}
