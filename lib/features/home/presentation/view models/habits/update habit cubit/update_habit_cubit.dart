import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/habit model/habit_model.dart';
import '../../../../data/repos/habits repo/habits_repo.dart';

part 'update_habit_state.dart';

class UpdateHabitCubit extends Cubit<UpdateHabitState> {
  UpdateHabitCubit(this.habitRepo) : super(UpdateHabitInitial());

  final HabitsRepo habitRepo;

  Future<void> updateHabit(
      {required HabitModel habit,
      required String uid,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(UpdateHabitLoading());
    final result = await habitRepo.updateHabit(
        habit: habit,
        isConnected: isConnected,
        isAnonymous: isAnonymous,
        uid: uid);
    result.fold((failure) {
      emit(UpdateHabitFailure(failure.errMessage));
    }, (r) {
      emit(UpdateHabitSuccess());
    });
  }
}
