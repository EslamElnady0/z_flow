import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../../models/task model/task_model.dart';

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>> getTasks({required String uid});
  Future<void> addTask({required TaskModel task, required String uid});
  Future<void> deleteTask({required TaskModel task, required String uid});
  Future<void> updateTask({required TaskModel task, required String uid});
}

class TasksRemoteDataSourceImpl implements TasksRemoteDataSource {
  @override
  Future<void> addTask({required TaskModel task, required String uid}) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.tasksCollection)
        .doc("${task.title} ${task.id}")
        .set(task.toJson());
  }

  @override
  Future<void> deleteTask(
      {required TaskModel task, required String uid}) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.tasksCollection)
        .doc("${task.title} ${task.id}")
        .delete();
  }

  @override
  Future<List<TaskModel>> getTasks({required String uid}) async {
    var tasks = await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.tasksCollection)
        .get()
        .then((value) =>
            value.docs.map((e) => TaskModel.fromJson(e.data())).toList());

    return tasks;
  }

  @override
  Future<void> updateTask(
      {required TaskModel task, required String uid}) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.tasksCollection)
        .doc("${task.title} ${task.id}")
        .update(task.toJson());
  }
}
