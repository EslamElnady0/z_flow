import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/styles/styles.dart';
import '../../ui logic/ui models/bottom_nav_bar_item_model.dart';

class SelectedBottomNavBarItem extends StatelessWidget {
  final MapEntry<int, BottomNavBarItemModel> bottomNavModelEntry;
  const SelectedBottomNavBarItem({
    super.key,
    required this.bottomNavModelEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 111.w,
      height: 56.h,
      padding: Intl.getCurrentLocale() == "en"
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            color: Colors.white.withOpacity(0.25))
      ], color: Colors.white, borderRadius: BorderRadius.circular(37.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            bottomNavModelEntry.value.icon,
            height: 24.h,
            width: 24.w,
            color: ColorManager.primaryColor,
          ),
          SizedBox(width: Intl.getCurrentLocale() == "en" ? 10.w : 5.w),
          Intl.getCurrentLocale() == "en"
              ? Text(
                  bottomNavModelEntry.value.title,
                  textAlign: TextAlign.center,
                  style: Styles.style16W600grey
                      .copyWith(color: ColorManager.primaryColor),
                )
              : Expanded(
                  child: Text(
                    bottomNavModelEntry.value.title,
                    textAlign: TextAlign.center,
                    style: Styles.style15w400.copyWith(
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
        ],
      ),
    );
  }
}
