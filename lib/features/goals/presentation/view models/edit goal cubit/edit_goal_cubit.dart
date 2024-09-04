import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/goals/data/repo/goals_repo.dart';

import '../../../data/model/goal_model.dart';

part 'edit_goal_state.dart';

class EditGoalCubit extends Cubit<EditGoalState> {
  EditGoalCubit({required this.goalsRepo}) : super(EditGoalInitial());
  final GoalsRepo goalsRepo;

  Future<void> editGoal(
      {required GoalModel goalModel,
      required bool isAnonymous,
      required bool isConnected}) async {
    emit(EditGoalLoading());
    var result = await goalsRepo.updateGoal(
        goal: goalModel, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(EditGoalFailure(message: failure.errMessage));
    }, (r) {
      emit(EditGoalSuccess());
    });
  }
}
