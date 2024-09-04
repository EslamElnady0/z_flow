import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/constants.dart';
import '../model/goal_model.dart';

abstract class GoalsLocalDataSource {
  List<GoalModel> getGoals();
  void addGoal(GoalModel goal);
  void deleteGoal(GoalModel goal);
  void deleteAllGoals();
  void updateGoal(GoalModel goal);
}

class GoalsLocalDataSourceImpl implements GoalsLocalDataSource {
  @override
  void addGoal(GoalModel goal) {
    var goalsBox = Hive.box<GoalModel>(Constants.goalsBox);

    goalsBox.add(goal);
  }

  @override
  void deleteAllGoals() {
    var goalsBox = Hive.box<GoalModel>(Constants.goalsBox);
    goalsBox.clear();
  }

  @override
  void deleteGoal(GoalModel goal) {
    goal.delete();
  }

  @override
  List<GoalModel> getGoals() {
    var goalsBox = Hive.box<GoalModel>(Constants.goalsBox);

    return goalsBox.values.toList();
  }

  @override
  void updateGoal(GoalModel goal) {
    goal.save();
  }
}
