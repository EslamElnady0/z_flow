import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';

import 'package:z_flow/features/home/presentation/views/widgets/account_section.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import '../widgets/custom_profile_stats_item.dart';
import '../widgets/profile_custom_divider.dart';

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
          CustomProfileStatsItem(
            title: AppTexts.tasks,
            completedText: AppTexts.completedTasks,
            pendingText: AppTexts.pendingTasks,
            completed: getIt.get<GetTaskCubit>().doneTasks,
            onGoing: getIt.get<GetTaskCubit>().onGoingTasks,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          CustomProfileStatsItem(
            title: AppTexts.habits,
            completedText: AppTexts.completedHabits,
            pendingText: AppTexts.pendingHabits,
            completed: getIt.get<GetHabitCubit>().doneHabits,
            onGoing: getIt.get<GetHabitCubit>().onGoinghabits,
          ),
        ],
      ),
    );
  }
}
