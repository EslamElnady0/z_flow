import '../../models/task model/task_model.dart';

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteAllDoneTasks();
}

class TasksRemoteDataSourceImpl implements TasksRemoteDataSource {
  @override
  Future<void> addTask(TaskModel task) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllDoneTasks() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(TaskModel task) {
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> getTasks() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(TaskModel task) {
    throw UnimplementedError();
  }
}
