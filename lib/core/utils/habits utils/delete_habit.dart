import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/habits%20utils/get_habits.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/delete%20habit%20cubit/delete_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';

import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> deleteHabit({required HabitModel habit}) async {
  getIt.get<DeleteHabitCubit>().deleteHabit(
      habit: habit,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
      uid: getIt.get<FirebaseAuth>().currentUser!.uid);

  getIt.get<GetHabitCubit>().habits.remove(habit);
  getIt.get<GetHabitCubit>().doneHabits.remove(habit);
  getIt.get<GetHabitCubit>().onGoinghabits.remove(habit);
  //remove from fav

  await getHabits();
  //get fav
}
