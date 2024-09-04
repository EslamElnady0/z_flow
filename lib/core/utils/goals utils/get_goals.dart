import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/goals/presentation/view models/get goals cubit/get_goals_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> getGoals() async {
  await getIt.get<GetGoalsCubit>().getGoals(
        isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
        isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      );
}
