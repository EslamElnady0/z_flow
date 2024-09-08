import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
      required bool isAnonymous}) async {
    emit(GetHabitLoading());
    final result = await habitRepo.getHabits(
        isConnected: isConnected, isAnonymous: isAnonymous, uid: uid);
    result.fold((failure) {
      emit(GetHabitFailure(failure.errMessage));
    }, (habitsList) {
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
          todaysDoneHabits =
              getRecentDoneHabitsFilter(const Duration(hours: 24));
        }
      }
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
