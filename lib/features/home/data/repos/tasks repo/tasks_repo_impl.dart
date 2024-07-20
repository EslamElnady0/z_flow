import 'package:dartz/dartz.dart';

import 'package:z_flow/core/errors/failure.dart';

import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import 'tasks_repo.dart';

class TasksRepoImpl implements TasksRepo {
  @override
  Either<Failure, Future<void>> addTask(TaskModel task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Either<Failure, Future<void>> deleteTask(TaskModel task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Either<Failure, Future<List<TaskModel>>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Either<Failure, Future<void>> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
