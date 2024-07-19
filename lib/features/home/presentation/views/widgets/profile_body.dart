import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:z_flow/features/home/presentation/views/widgets/account_section.dart';

import '../../../../../core/constants/app_texts.dart';
import 'custom_profile_stats_item.dart';
import 'profile_custom_divider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const AccountSection(),
          const ProfileCustomDivider(),
          const CustomProfileStatsItem(
            title: AppTexts.tasks,
            completedText: AppTexts.completedTasks,
            pendingText: AppTexts.pendingTasks,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          const CustomProfileStatsItem(
            title: AppTexts.habits,
            completedText: AppTexts.completedHabits,
            pendingText: AppTexts.pendingHabits,
          ),
        ],
      ),
    );
  }
}
