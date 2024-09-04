import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:z_flow/core/errors/failure.dart';
import 'package:z_flow/features/goals/data/data%20sources/goals_local_data_source.dart';
import 'package:z_flow/features/goals/data/data%20sources/goals_remote_data_source.dart';

import 'package:z_flow/features/goals/data/model/goal_model.dart';

import 'goals_repo.dart';

class GoalsRepoImpl implements GoalsRepo {
  final GoalsLocalDataSource goalsLocalDataSource;
  final GoalsRemoteDataSource goalsRemoteDataSource;
  GoalsRepoImpl(
      {required this.goalsLocalDataSource,
      required this.goalsRemoteDataSource});
  @override
  Future<Either<Failure, void>> addGoal(
      {required GoalModel goal,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await goalsRemoteDataSource.addGoal(goal);
      }

      goalsLocalDataSource.addGoal(goal);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> deleteGoal(
      {required GoalModel goal,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await goalsRemoteDataSource.deleteGoal(goal);
      }

      goalsLocalDataSource.deleteGoal(goal);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, List<GoalModel>>> getGoals(
      {required bool isConnected, required bool isAnonymous}) async {
    try {
      List<GoalModel> goals = goalsLocalDataSource.getGoals();
      if (goals.isNotEmpty) {
        return right(goals);
      } else {
        if (isConnected && !isAnonymous) {
          goals = await goalsRemoteDataSource.getGoals();

          for (var goal in goals) {
            goalsLocalDataSource.addGoal(goal);
          }
          return right(goals);
        }
        return right(goals);
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateGoal(
      {required GoalModel goal,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await goalsRemoteDataSource.updateGoal(goal);
      }

      goalsLocalDataSource.updateGoal(goal);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }
}
