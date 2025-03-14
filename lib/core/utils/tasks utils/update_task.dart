import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/core/utils/tasks%20utils/get_tasks.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/update%20task%20cubit/update_task_cubit.dart';

import '../../../features/home/data/models/task model/task_model.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import '../notifications_helpers.dart';

Future<void> updateTask({required TaskModel task}) async {
  await getIt.get<UpdateTaskCubit>().updateTask(
      task: task,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      uid: getIt.get<FirebaseAuth>().currentUser?.uid ?? "");
  if (task.isDone) {
    getIt.get<GetTaskCubit>().onGoingTasks.remove(task);
    getIt.get<GetTaskCubit>().categorizedOngoingTasks.remove(task);
    getIt.get<GetTaskCubit>().categorizedDoneTasks.add(task);
    LocalNotifications.cancelNotification(id: task.id + tasksOffset);
  } else {
    getIt.get<GetTaskCubit>().doneTasks.remove(task);
    getIt.get<GetTaskCubit>().categorizedDoneTasks.remove(task);
    getIt.get<GetTaskCubit>().categorizedOngoingTasks.add(task);
  }
  await getTasks();
}
