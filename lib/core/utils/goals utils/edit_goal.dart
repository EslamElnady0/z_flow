import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/goals/data/model/goal_model.dart';
import '../../../features/goals/presentation/view models/edit goal cubit/edit_goal_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> editGoal({required GoalModel goal}) async {
  await getIt.get<EditGoalCubit>().editGoal(
        goalModel: goal,
        isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
        isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      );
}
