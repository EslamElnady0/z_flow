import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/habits%20utils/get_habits.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/update%20habit%20cubit/update_habit_cubit.dart';

import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> updateHabit({required HabitModel habit}) async {
  await getIt.get<UpdateHabitCubit>().updateHabit(
      habit: habit,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
      uid: getIt.get<FirebaseAuth>().currentUser!.uid);
  await getHabits();
}
