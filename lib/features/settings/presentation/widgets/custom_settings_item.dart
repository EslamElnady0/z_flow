import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/settings/presentation/widgets/settings_item_trailing.dart';

import '../../../../core/styles/styles.dart';
import '../ui model/settings_item_model.dart';

class CustomSettingsItem extends StatelessWidget {
  final SettingsItemModel model;
  final int index;
  final VoidCallback onTap;
  const CustomSettingsItem(
      {super.key,
      required this.model,
      required this.onTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: Constants.customButtonGradient),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.title,
                style: Styles.style16W600grey.copyWith(color: Colors.white)),
            SettingsItemTrailing(
              index: index,
              icon: model.icon,
            )
          ],
        ),
      ),
    );
  }
}
