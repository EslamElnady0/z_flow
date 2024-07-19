import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../ui models/bottom_nav_bar_item_model.dart';

class UnSelectedBottomNavBarItem extends StatelessWidget {
  final MapEntry<int, BottomNavBarItemModel> bottomNavModelEntry;

  const UnSelectedBottomNavBarItem({
    super.key,
    required this.bottomNavModelEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
      child: SvgPicture.asset(
        bottomNavModelEntry.value.icon,
        color: Colors.white,
        height: 24.h,
        width: 24.w,
      ),
    );
  }
}
