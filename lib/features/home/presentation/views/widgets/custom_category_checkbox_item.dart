import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';

class CustomCategoryCheckboxItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final String title;
  const CustomCategoryCheckboxItem(
      {super.key,
      required this.index,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 3.h, 1.w, 3.h),
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
        trailing: CustomCheckBox(
          value: false,
        ),
      ),
    );
  }
}
