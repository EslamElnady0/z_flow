import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';

import '../../../../data/repos/habits repo/habits_repo.dart';

part 'get_habit_state.dart';

class GetHabitCubit extends Cubit<GetHabitState> {
  GetHabitCubit(this.habitRepo) : super(GetHabitInitial());

  final HabitsRepo habitRepo;
  List<HabitModel> habits = [];

  Future<void> getHabits(
      {required String uid,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(GetHabitLoading());
    final result = await habitRepo.getHabits(
        isConnected: isConnected, isAnonymous: isAnonymous, uid: uid);
    result.fold((failure) {
      emit(GetHabitFailure(failure.errMessage));
    }, (r) {
      habits = r;
      emit(GetHabitSucuess());
    });
  }
}
