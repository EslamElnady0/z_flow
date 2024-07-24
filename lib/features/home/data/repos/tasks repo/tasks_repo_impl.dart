import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:z_flow/core/errors/failure.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_local_data_source.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import '../../data sources/tasks/tasks_remote_data_source.dart';
import 'tasks_repo.dart';

class TasksRepoImpl implements TasksRepo {
  final TasksLocalDataSource tasksLocalDataSource;
  final TasksRemoteDataSource tasksRemoteDataSource;
  TasksRepoImpl(this.tasksLocalDataSource, this.tasksRemoteDataSource);

  @override
  Future<Either<Failure, Future<void>>> addTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      if (isConnected && !isAnonymous) {
        await tasksRemoteDataSource.addTask(task: task, uid: uid);
      }
      await tasksLocalDataSource.addTask(task);

      return right(Future.value(null));
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "'Server Error, please try again'"));
      }
    }
  }

  @override
  Future<Either<Failure, Future<void>>> deleteTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      tasksLocalDataSource.deleteTask(task);
      if (isConnected && !isAnonymous) {
        await tasksRemoteDataSource.deleteTask(task: task, uid: uid);
      }
      return right(Future.value(null));
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "'Server Error, please try again'"));
      }
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks(
      {required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      List<TaskModel>? tasks = tasksLocalDataSource.getTasks();
      if (tasks!.isNotEmpty) {
        return right(tasks);
      } else {
        if (isConnected && !isAnonymous) {
          tasks = await tasksRemoteDataSource.getTasks(uid: uid);
          if (tasks.isNotEmpty) {
            for (var task in tasks) {
              await tasksLocalDataSource.addTask(task);
            }
            return right(tasks);
          } else {
            return right(tasks);
          }
        }
        return right(tasks);
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "'Server Error, please try again'"));
      }
    }
  }

  @override
  Future<Either<Failure, Future<void>>> updateTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      tasksLocalDataSource.updateTask(task);
      if (isConnected && !isAnonymous) {
        await tasksRemoteDataSource.updateTask(task: task, uid: uid);
      }
      return right(Future.value(null));
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "'Server Error, please try again'"));
      }
    }
  }
}
