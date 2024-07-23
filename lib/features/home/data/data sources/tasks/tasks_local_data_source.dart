import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/constants/constants.dart';
import '../../models/task model/task_model.dart';

abstract class TasksLocalDataSource {
  List<TaskModel>? getTasks();
  Future<void> addTask(TaskModel task);
  void deleteTask(TaskModel task);
  void updateTask(TaskModel task);
  void deleteAllDoneTasks();
}

class TasksLocalDataSourceImpl implements TasksLocalDataSource {
  @override
  List<TaskModel>? getTasks() {
    var tasksBox = Hive.box<TaskModel>(Constants.tasksBox);
    List<TaskModel>? allTasks = tasksBox.values.toList();

    return allTasks;
  }

  @override
  Future<void> addTask(TaskModel task) async {
    var taskBox = Hive.box<TaskModel>(Constants.tasksBox);
    await taskBox.add(task);
  }

  @override
  void deleteTask(TaskModel task) {
    task.delete();
  }

  @override
  void updateTask(TaskModel task) {
    task.save();
  }

  @override
  void deleteAllDoneTasks() {
    throw UnimplementedError();
  }
}
