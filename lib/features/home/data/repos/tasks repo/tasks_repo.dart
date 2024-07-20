import 'package:dartz/dartz.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class TasksRepo {
  Either<Failure, Future<List<TaskModel>>> getTasks();

  Either<Failure, Future<void>> addTask(TaskModel task);

  Either<Failure, Future<void>> deleteTask(TaskModel task);

  Either<Failure, Future<void>> updateTask(TaskModel task);
}
