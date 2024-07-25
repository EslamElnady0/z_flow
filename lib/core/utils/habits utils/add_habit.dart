import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/core/utils/increament_id_methods.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/add%20habit%20cubit/add_habits_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';

Future<void> addHabit({required HabitModel habit}) async {
  await getIt.get<AddHabitCubit>().addHabit(
        habit: habit,
        uid: getIt.get<FirebaseAuth>().currentUser!.uid,
        isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
        isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
      );

  getIt.get<GetHabitCubit>().habits.add(habit);

  incrementHabitsId();
}
