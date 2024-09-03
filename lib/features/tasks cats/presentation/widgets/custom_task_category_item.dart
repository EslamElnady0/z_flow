import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../../../../core/styles/styles.dart';

class TaskCategoryItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final String title;
  const TaskCategoryItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: index == 0 ? 12.h : 0,
        bottom: index == Constants.drawerItems.length - 1 ? 12.h : 0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: Constants.customButtonGradient),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        onTap: onTap,
        title: Text(
          title,
          style: Styles.style20W700white,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
