import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/core/utils/habits%20utils/get_habits.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/update%20habit%20cubit/update_habit_cubit.dart';

import '../../../features/home/presentation/view models/habits/get habits cubit/get_habit_cubit.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import '../notifications_helpers.dart';

Future<void> updateHabit(
    {required HabitModel habit, required BuildContext context}) async {
  await getIt.get<UpdateHabitCubit>().updateHabit(
      habit: habit,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
      uid: getIt.get<FirebaseAuth>().currentUser!.uid);
  if (habit.isDone) {
    getIt.get<GetHabitCubit>().onGoinghabits.remove(habit);
    LocalNotifications.cancelNotification(id: habit.id + habitsOffset);
  } else {
    getIt.get<GetHabitCubit>().doneHabits.remove(habit);
  }
  if (context.mounted) {
    await getHabits(context);
  }
  if (!habit.isIterable) {
    LocalNotifications.cancelNotification(id: habit.id + habitsOffset);
  } else if (habit.isIterable) {
    if (context.mounted) {
      setDailyHabitsNotification(habit, context);
    }
  }
}
