import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';

import '../../../../core/styles/styles.dart';

class CustomGoalItem extends StatelessWidget {
  final GoalModel goal;
  final VoidCallback onTap;
  const CustomGoalItem({super.key, required this.goal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Text(goal.title, style: Styles.style16W500grey),
          ],
        ));
  }
}
