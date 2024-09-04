import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/goal_model.dart';
import '../../../data/repo/goals_repo.dart';

part 'add_goal_state.dart';

class AddGoalCubit extends Cubit<AddGoalState> {
  AddGoalCubit({required this.goalsRepo}) : super(AddGoalInitial());

  final GoalsRepo goalsRepo;

  Future<void> addGoal(
      {required GoalModel goalModel,
      required bool isAnonymous,
      required bool isConnected}) async {
    emit(AddGoalLoading());
    var result = await goalsRepo.addGoal(
        goal: goalModel, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(AddGoalFailure(message: failure.errMessage));
    }, (r) {
      emit(AddGoalSuccess());
    });
  }
}
