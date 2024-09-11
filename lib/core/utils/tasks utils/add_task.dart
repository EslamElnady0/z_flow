import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/core/utils/increament_id_methods.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';

import '../../../features/home/data/models/task model/task_model.dart';
import '../../../features/home/presentation/view models/tasks/add task cubit/add_task_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_tasks.dart';

Future<void> addTask(
    {required TaskModel task, required BuildContext context}) async {
  await getIt.get<AddTaskCubit>().addTask(
      task: task,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
      uid: getIt.get<FirebaseAuth>().currentUser!.uid);
  getIt.get<GetTaskCubit>().tasks.add(task);

  incrementTasksId();
  if (task.deadline != "") {
    await LocalNotifications.requestNotificationPermission();
    if (context.mounted) {
      scheduleTaskNotification(task, context);
    }
  }
  await getTasks();
}
