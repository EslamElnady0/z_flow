import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/goals/data/model/goal_model.dart';
import '../../../features/goals/presentation/view models/delete goal cubit/delete_goal_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_goals.dart';

Future<void> deleteGoal({required GoalModel goal}) async {
  await getIt.get<DeleteGoalCubit>().deleteGoal(
        goalModel: goal,
        isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
        isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      );
  await getGoals();
}
