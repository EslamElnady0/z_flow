import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/features/favourites/data/view%20models/favourite%20tasks%20cubit/favourite_tasks_cubit.dart';

import '../../../features/home/data/models/task model/task_model.dart';
import '../../../features/home/presentation/view models/tasks/delete task cubit/delete_task_cubit.dart';
import '../../../features/home/presentation/view models/tasks/get task cubit/get_task_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import '../../services/local_notifications.dart';
import '../notifications_helpers.dart';
import 'get_tasks.dart';

Future<void> deleteTask({required TaskModel task}) async {
  await getIt.get<DeleteTaskCubit>().deleteTask(
      task: task,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      uid: getIt.get<FirebaseAuth>().currentUser?.uid ?? "");

  getIt.get<GetTaskCubit>().tasks.remove(task);
  getIt.get<GetTaskCubit>().specificDayTasksList.remove(task);
  getIt.get<GetTaskCubit>().doneTasks.remove(task);
  getIt.get<GetTaskCubit>().onGoingTasks.remove(task);
  getIt.get<FavouriteTasksCubit>().favTasks.remove(task);
  LocalNotifications.cancelNotification(id: task.id + tasksOffset);
  getIt.get<FavouriteTasksCubit>().getFavTasks();
  await getTasks();
}
