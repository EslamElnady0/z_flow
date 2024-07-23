import 'package:dartz/dartz.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class TasksRepo {
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required bool isConnected,
    required String uid,
    required bool isAnonymous,
  });

  Future<Either<Failure, Future<void>>> addTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid});

  Future<Either<Failure, Future<void>>> deleteTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid});

  Future<Either<Failure, Future<void>>> updateTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid});
}
