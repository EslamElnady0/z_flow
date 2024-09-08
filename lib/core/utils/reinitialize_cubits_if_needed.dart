import 'package:z_flow/features/goals/data/repo/goals_repo_impl.dart';
import 'package:z_flow/features/goals/presentation/view%20models/get%20goals%20cubit/get_goals_cubit.dart';
import 'package:z_flow/features/home/data/repos/tasks%20repo/tasks_repo_impl.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/get%20events%20cubit/get_events_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';

import '../../features/reminder/data/repo/events_repo_impl.dart';
import '../../features/tasks cats/data/repos/task_cats_repo_impl.dart';
import '../DI/service_locator.dart';

void reinitializeGetCategoriesCubitIfNeeded() {
  if (!getIt.isRegistered<GetTasksCategoriesCubit>()) {
    getIt.registerSingleton<GetTasksCategoriesCubit>(
        GetTasksCategoriesCubit(taskCatsRepo: getIt.get<TaskCatsRepoImpl>()));
  }
}

void reinitializeGetGoalsCubitIfNeeded() {
  if (!getIt.isRegistered<GetGoalsCubit>()) {
    getIt.registerSingleton<GetGoalsCubit>(
        GetGoalsCubit(goalsRepo: getIt.get<GoalsRepoImpl>()));
  }
}

void reinitializeGetEventsCubitIfNeeded() {
  if (!getIt.isRegistered<GetEventsCubit>()) {
    getIt.registerSingleton<GetEventsCubit>(
        GetEventsCubit(eventsRepo: getIt.get<EventsRepoImpl>()));
  }
}

void reinitializeGetTasksCubitIfNeeded() {
  if (!getIt.isRegistered<GetTaskCubit>()) {
    getIt.registerSingleton<GetTaskCubit>(
        GetTaskCubit(getIt.get<TasksRepoImpl>()));
  }
}
