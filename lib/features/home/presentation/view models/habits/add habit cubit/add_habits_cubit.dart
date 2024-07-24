import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/repos/habits%20repo/habits_repo.dart';

import '../../../../data/models/habit model/habit_model.dart';

part 'add_habits_state.dart';

class AddHabitCubit extends Cubit<AddHabitsState> {
  AddHabitCubit(this.habitRepo) : super(AddHabitInitial());
  final HabitsRepo habitRepo;
  Future<void> addHabit(
      {required HabitModel habit,
      required String uid,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(AddHabitLoading());
    final result = await habitRepo.addHabit(
        habit: habit,
        isConnected: isConnected,
        isAnonymous: isAnonymous,
        uid: uid);
    result.fold((failure) {
      emit(AddHabitFailure(failure.errMessage));
    }, (r) {
      emit(AddHabitSuccess());
    });
  }
}
