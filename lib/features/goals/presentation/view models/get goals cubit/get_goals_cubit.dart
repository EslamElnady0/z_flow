import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';
import 'package:z_flow/features/goals/data/repo/goals_repo.dart';

part 'get_goals_state.dart';

class GetGoalsCubit extends Cubit<GetGoalsState> {
  GetGoalsCubit({required this.goalsRepo}) : super(GetGoalsInitial());

  final GoalsRepo goalsRepo;
  List<GoalModel> goals = [];
  Future<void> getGoals(
      {required bool isConnected, required bool isAnonymous}) async {
    emit(GetGoalsLoading());
    var result = await goalsRepo.getGoals(
        isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(GetGoalsFailure(message: failure.errMessage));
    }, (goalsList) {
      goals = goalsList;
      emit(GetGoalsSuccess());
    });
  }
}
