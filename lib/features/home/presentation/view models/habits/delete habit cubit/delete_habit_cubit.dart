import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/data/repos/habits%20repo/habits_repo.dart';

part 'delete_habit_state.dart';

class DeleteHabitCubit extends Cubit<DeleteHabitState> {
  DeleteHabitCubit(this.habitsRepo) : super(DeleteHabitInitial());

  final HabitsRepo habitsRepo;

  Future<void> deleteHabit(
      {required HabitModel habit,
      required String uid,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(DeleteHabitLoading());
    final result = await habitsRepo.deleteHabit(
        habit: habit,
        isConnected: isConnected,
        isAnonymous: isAnonymous,
        uid: uid);
    result.fold((failure) {
      emit(DeleteHabitFailure(failure.errMessage));
    }, (r) {
      emit(DeleteHabitSuccess());
    });
  }
}
