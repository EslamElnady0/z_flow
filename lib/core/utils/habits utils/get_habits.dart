import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';

import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> getHabits() async {
  await getIt.get<GetHabitCubit>().getHabits(
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      uid: getIt.get<FirebaseAuth>().currentUser?.uid ?? "");
}

void clearAllHabitsLists() {
  getIt.get<GetHabitCubit>().habits.clear();
  getIt.get<GetHabitCubit>().onGoinghabits.clear();
  getIt.get<GetHabitCubit>().doneHabits.clear();
}
