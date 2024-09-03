import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/home/presentation/view models/tasks/get task cubit/get_task_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> getTasks() async {
  await getIt.get<GetTaskCubit>().getTasks(
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      uid: getIt.get<FirebaseAuth>().currentUser?.uid ?? "");
}

void clearAllTasksLists() {
  getIt.get<GetTaskCubit>().tasks.clear();
  getIt.get<GetTaskCubit>().onGoingTasks.clear();
  getIt.get<GetTaskCubit>().doneTasks.clear();
  getIt.get<GetTaskCubit>().specificDayTasksList.clear();
  getIt.get<GetTaskCubit>().categorizedOngoingTasks.clear();
  getIt.get<GetTaskCubit>().categorizedDoneTasks.clear();
  getIt.get<GetTaskCubit>().categorizedTasks.clear();
}
