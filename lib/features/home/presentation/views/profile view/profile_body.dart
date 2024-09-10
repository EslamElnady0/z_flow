import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';

import 'package:z_flow/features/home/presentation/views/widgets/account_section.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import '../widgets/all_habits_duration_options.dart';
import '../widgets/custom_profile_stats_item.dart';
import '../widgets/finished_tasks_filter_options.dart';
import '../widgets/profile_custom_divider.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    getIt.get<GetTaskCubit>().getRecentTasksFilter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const AccountSection(),
          const ProfileCustomDivider(),
          BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, state) {
              return CustomProfileStatsItem(
                title: AppTexts.tasks,
                completedText: AppTexts.completedTasks,
                pendingText: AppTexts.pendingTasks,
                optionsWidget: const FinishedTasksDurationOptions(),
                completed: getIt.get<GetTaskCubit>().recentDoneTasks,
                onGoing: getIt.get<GetTaskCubit>().recentOngoingTasks,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          BlocBuilder<GetHabitCubit, GetHabitState>(
            builder: (context, state) {
              return CustomProfileStatsItem(
                title: AppTexts.habits,
                optionsWidget: const AllHabitsDurationOptions(),
                completedText: AppTexts.completedHabits,
                pendingText: AppTexts.pendingHabits,
                completed: getIt.get<GetHabitCubit>().recentDoneHabits,
                onGoing: getIt.get<GetHabitCubit>().recentOnGoingHabits,
              );
            },
          ),
        ],
      ),
    );
  }
}
