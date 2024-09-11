import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/core/utils/goals%20utils/get_goals.dart';
import 'package:z_flow/core/utils/increament_id_methods.dart';
import 'package:z_flow/features/goals/presentation/view%20models/get%20goals%20cubit/get_goals_cubit.dart';

import '../../../features/goals/data/model/goal_model.dart';
import '../../../features/goals/presentation/view models/add goal cubit/add_goal_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> addGoal(
    {required GoalModel goal, required BuildContext context}) async {
  await getIt.get<AddGoalCubit>().addGoal(
        goalModel: goal,
        isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
        isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      );
  getIt.get<GetGoalsCubit>().goals.add(goal);
  incrementGoalsId();
  await getGoals();

  if (context.mounted) {
    LocalNotifications.showPeriodicNotification(
        title: S.of(context).myGoals,
        body: S.of(context).keepWorkingHard,
        payload: "",
        id: 0);
  }
}
