import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';

import '../../../../data/repos/habits repo/habits_repo.dart';

part 'get_habit_state.dart';

class GetHabitCubit extends Cubit<GetHabitState> {
  GetHabitCubit(this.habitRepo) : super(GetHabitInitial());

  final HabitsRepo habitRepo;
  List<HabitModel> habits = [];
  List<HabitModel> onGoinghabits = [];
  List<HabitModel> doneHabits = [];

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
        }
      }
      emit(GetHabitSucuess());
    });
  }
}
