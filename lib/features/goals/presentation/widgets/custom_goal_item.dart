import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';

class CustomGoalItem extends StatelessWidget {
  final GoalModel goal;
  final VoidCallback onTap;
  const CustomGoalItem({super.key, required this.goal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 250.w,
                  child: Text(
                    goal.title,
                    style: Styles.style16W500grey,
                    overflow: TextOverflow.ellipsis,
                  )),
              SvgPicture.asset(
                Assets.editIcon,
                height: 16.h,
                width: 16.w,
                color: Colors.grey,
              ),
            ],
          )),
    );
  }
}
