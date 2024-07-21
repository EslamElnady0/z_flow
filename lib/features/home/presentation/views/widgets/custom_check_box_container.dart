import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box.dart';

class CustomCheckBoxContainer extends StatelessWidget {
  const CustomCheckBoxContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      padding: EdgeInsets.only(left: 12.w),
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: Constants.customButtonGradient,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTexts.finishTask,
            style: Styles.style18w600,
          ),
          const CustomCheckBox()
        ],
      ),
    );
  }
}
