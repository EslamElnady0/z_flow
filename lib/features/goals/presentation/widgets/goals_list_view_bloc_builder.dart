import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/goals/presentation/view%20models/get%20goals%20cubit/get_goals_cubit.dart';
import 'package:z_flow/features/goals/presentation/widgets/custom_goal_item.dart';

import '../../../../core/routes/app_router.dart';

class GoalsListViewBlocBuilder extends StatelessWidget {
  const GoalsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGoalsCubit, GetGoalsState>(
      builder: (context, state) {
        if (getIt.get<GetGoalsCubit>().goals.isEmpty) {
          return const Spacer();
        } else {
          return Expanded(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CustomGoalItem(
                    goal: getIt.get<GetGoalsCubit>().goals[index],
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.editGoal,
                          arguments: getIt.get<GetGoalsCubit>().goals[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 12.h,
                    ),
                itemCount: getIt.get<GetGoalsCubit>().goals.length),
          );
        }
      },
    );
  }
}
