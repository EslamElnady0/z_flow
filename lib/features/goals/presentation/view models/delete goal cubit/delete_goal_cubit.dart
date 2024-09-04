import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/goal_model.dart';
import '../../../data/repo/goals_repo.dart';

part 'delete_goal_state.dart';

class DeleteGoalCubit extends Cubit<DeleteGoalState> {
  DeleteGoalCubit({required this.goalsRepo}) : super(DeleteGoalInitial());

  final GoalsRepo goalsRepo;

  Future<void> deleteGoal(
      {required GoalModel goalModel,
      required bool isAnonymous,
      required bool isConnected}) async {
    emit(DeleteGoalLoading());
    var result = await goalsRepo.updateGoal(
        goal: goalModel, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(DeleteGoalFailure(message: failure.errMessage));
    }, (r) {
      emit(DeleteGoalSuccess());
    });
  }
}
