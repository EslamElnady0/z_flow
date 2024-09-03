import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../../../../core/styles/styles.dart';

class TaskCategoryItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final String title;
  final bool isEdit;
  const TaskCategoryItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.title,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "taskCategory-$index",
      child: Material(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
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
            trailing: isEdit
                ? SvgPicture.asset(
                    Assets.arrowDownIos,
                    height: 11.h,
                    width: 11.w,
                  )
                : const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
