import '../model/goal_model.dart';

abstract class GoalsRemoteDataSource {
  Future<List<GoalModel>> getGoals();
  Future<void> addGoal(GoalModel goal);
  Future<void> deleteGoal(GoalModel goal);
  Future<void> updateGoal(GoalModel goal);
}

class GoalsRemoteDataSourceImpl implements GoalsRemoteDataSource {
  @override
  Future<void> addGoal(GoalModel goal) {
    // TODO: implement addGoal
    throw UnimplementedError();
  }

  @override
  Future<void> deleteGoal(GoalModel goal) {
    // TODO: implement deleteGoal
    throw UnimplementedError();
  }

  @override
  Future<List<GoalModel>> getGoals() {
    // TODO: implement getGoals
    throw UnimplementedError();
  }

  @override
  Future<void> updateGoal(GoalModel goal) {
    // TODO: implement updateGoal
    throw UnimplementedError();
  }
}
