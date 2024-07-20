import 'package:dartz/dartz.dart';

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
