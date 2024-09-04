import 'package:dartz/dartz.dart';
import 'package:z_flow/core/errors/failure.dart';

import '../model/goal_model.dart';

abstract class GoalsRepo {
  Future<Either<Failure, List<GoalModel>>> getGoals(
      {required bool isConnected, required bool isAnonymous});
  Future<Either<Failure, void>> addGoal(
      {required GoalModel goal,
      required bool isConnected,
      required bool isAnonymous});
  Future<Either<Failure, void>> deleteGoal(
      {required GoalModel goal,
      required bool isConnected,
      required bool isAnonymous});
  Future<Either<Failure, void>> updateGoal(
      {required GoalModel goal,
      required bool isConnected,
      required bool isAnonymous});
}
