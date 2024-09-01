import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/errors/failure.dart';
import 'package:z_flow/features/tasks%20cats/data/data%20sources/task_cats_local_data_source.dart';
import 'package:z_flow/features/tasks%20cats/data/data%20sources/task_cats_remote_data_source.dart';

import 'task_cats_repo.dart';

class TaskCatsRepoImpl implements TaskCatsRepo {
  final TaskCatsLocalDataSource taskCatsLocalDataSource;
  final TaskCatsRemoteDataSource taskCatsRemoteDataSource;
  TaskCatsRepoImpl(
      {required this.taskCatsLocalDataSource,
      required this.taskCatsRemoteDataSource});
  @override
  Future<Either<Failure, void>> addTaskCats(
      {required String category,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (!isAnonymous && isConnected) {
        await taskCatsRemoteDataSource.addTaskCats(category);
      }
      taskCatsLocalDataSource.addTaskCats(category);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else if (e is HiveError) {
        return left(CacheFailure.fromHiveError(error: e));
      } else {
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> getTaskCats(
      {required bool isConnected, required bool isAnonymous}) async {
    try {
      List<String> tasksCats = taskCatsLocalDataSource.getTaskCats();
      if (tasksCats.isNotEmpty) {
        return right(tasksCats);
      } else {
        if (isConnected && !isAnonymous) {
          tasksCats = await taskCatsRemoteDataSource.getTaskCats();
          for (var category in tasksCats) {
            taskCatsLocalDataSource.addTaskCats(category);
          }
          return right(tasksCats);
        }
        return right(tasksCats);
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
}
