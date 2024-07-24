import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/utils/increament_id_methods.dart';
import 'package:z_flow/core/utils/tasks%20utils/get_tasks.dart';
import 'package:z_flow/features/home/presentation/view%20models/get%20task%20cubit/get_task_cubit.dart';

import '../../../features/home/data/models/task model/task_model.dart';
import '../../../features/home/presentation/view models/add task cubit/add_task_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> addTask(
    {required BuildContext context,
    required TextEditingController taskController,
    required TextEditingController subTaskController,
    required TextEditingController noteController,
    required TextEditingController endsInController}) async {
  var box = Hive.box(Constants.constantsBox);
  int id = box.get("id") ?? 0;
  TaskModel task = TaskModel(
    sideTask: subTaskController.text,
    title: taskController.text,
    notes: noteController.text,
    id: id,
    createdAt: DateTime.now().toString(),
    deadline: endsInController.text,
  );
  await getIt.get<AddTaskCubit>().addTask(
      task: task,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
      uid: getIt.get<FirebaseAuth>().currentUser!.uid);
  getIt.get<GetTaskCubit>().tasks.add(task);
  await getTasks();
  Navigator.pop(context);
  incrementTasksId();
}
