import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';

import '../../../../data/repos/habits repo/habits_repo.dart';

part 'get_habit_state.dart';

class GetHabitCubit extends Cubit<GetHabitState> {
  GetHabitCubit(this.habitRepo) : super(GetHabitInitial());

  final HabitsRepo habitRepo;
  Duration? duration;
  List<HabitModel> habits = [];
  List<HabitModel> onGoinghabits = [];
  List<HabitModel> doneHabits = [];
  List<HabitModel> recentDoneHabits = [];
  List<HabitModel> todaysDoneHabits = [];
  List<HabitModel> recentOnGoingHabits = [];

  Future<void> getHabits(
      {required String uid,
      required bool isConnected,
      required BuildContext context,
      required bool isAnonymous}) async {
    emit(GetHabitLoading());
    final result = await habitRepo.getHabits(
        context: context,
        isConnected: isConnected,
        isAnonymous: isAnonymous,
        uid: uid);
    result.fold((failure) {
      emit(GetHabitFailure(failure.errMessage));
    }, (habitsList) async {
      habits = habitsList;
      for (var i = 0; i < habits.length; i++) {
        if (!habits[i].isDone) {
          if (!onGoinghabits.contains(habits[i])) {
            onGoinghabits.add(habits[i]);
          }
        } else {
          if (!doneHabits.contains(habits[i])) {
            doneHabits.add(habits[i]);
          }
        }
      }
      for (var doneHabit in doneHabits) {
        DateTime deadline = parseDateString(doneHabit.deadline)!;
        DateTime now = DateTime.now();
        DateTime doneAt = DateTime.parse(doneHabit.doneAt);
        if (doneAt.add(const Duration(days: 1)).isBefore(now) &&
            deadline.isAfter(now)) {
          doneHabit.isDone = false;
          await habitRepo.updateHabit(
              habit: doneHabit,
              isConnected: isConnected,
              isAnonymous: isAnonymous,
              uid: uid);
        }
      }

      todaysDoneHabits = getRecentDoneHabitsFilter(const Duration(hours: 24));
      getRecentOnGoingHabitsFilter();
      emit(GetHabitSucuess());
    });
  }

  List<HabitModel> getRecentDoneHabitsFilter(Duration? duration) {
    if (duration == null) {
      recentDoneHabits = doneHabits;
      emit(GetHabitSucuess());
      return recentDoneHabits;
    } else {
      recentDoneHabits = [];

      DateTime now = DateTime.now();
      DateTime wantedDuration = now.subtract(duration);
      for (var habit in doneHabits) {
        if (habit.doneAt != "" && habit.isDone) {
          DateTime habitDoneDate = DateTime.parse(habit.doneAt);

          if (habitDoneDate.isAfter(wantedDuration)) {
            recentDoneHabits.add(habit);
          }
        }
      }
      emit(GetHabitSucuess());
      return recentDoneHabits;
    }
  }

  List<HabitModel> getRecentOnGoingHabitsFilter() {
    if (duration == null) {
      recentOnGoingHabits = onGoinghabits;
      emit(GetHabitSucuess());
      return recentOnGoingHabits;
    } else {
      recentOnGoingHabits = [];

      DateTime now = DateTime.now();
      DateTime wantedDuration = now.subtract(duration!);
      for (var habit in onGoinghabits) {
        if (!habit.isDone) {
          DateTime onGoingHabitDate = DateTime.parse(habit.createdAt);

          if (onGoingHabitDate.isAfter(wantedDuration)) {
            recentOnGoingHabits.add(habit);
          }
        }
      }
      emit(GetHabitSucuess());
      return recentOnGoingHabits;
    }
  }
}
