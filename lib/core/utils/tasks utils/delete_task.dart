import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/home/data/models/task model/task_model.dart';
import '../../../features/home/presentation/view models/delete task cubit/delete_task_cubit.dart';
import '../../../features/home/presentation/view models/get task cubit/get_task_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_tasks.dart';

Future<void> deleteTask({required TaskModel task}) async {
  getIt.get<DeleteTaskCubit>().deleteTask(
      task: task,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
      uid: getIt.get<FirebaseAuth>().currentUser!.uid);

  getIt.get<GetTaskCubit>().tasks.remove(task);
  getIt.get<GetTaskCubit>().specificDayTasksList.remove(task);
  await getTasks();
}
