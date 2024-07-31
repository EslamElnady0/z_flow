import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/features/auth/data/repos/auth_repo_impl.dart';
import 'package:z_flow/features/auth/presentation/view%20models/cubit/log_in_ano_cubit.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20out%20cubit/log_out_cubit.dart';
import 'package:z_flow/features/favourites/data/view%20models/favourite%20habits%20cubit/favourite_habits_cubit.dart';
import 'package:z_flow/features/favourites/data/view%20models/favourite%20tasks%20cubit/favourite_tasks_cubit.dart';
import 'package:z_flow/features/home/data/data%20sources/habits/habits_local_data_source.dart';
import 'package:z_flow/features/home/data/data%20sources/habits/habits_remote_data_source.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_local_data_source.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_remote_data_source.dart';
import 'package:z_flow/features/home/data/repos/tasks%20repo/tasks_repo_impl.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/add%20task%20cubit/add_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/delete%20task%20cubit/delete_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/update%20task%20cubit/update_task_cubit.dart';
import 'package:z_flow/features/search/search%20cubit/search_cubit.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/timer%20cubit/timer_cubit.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/work%20session%20cubit/work_session_cubit.dart';

import '../../features/auth/presentation/view models/sign up cubit/sign_up_cubit.dart';
import '../../features/home/data/repos/habits repo/habits_repo_impl.dart';
import '../../features/home/presentation/view models/habits/add habit cubit/add_habits_cubit.dart';
import '../../features/home/presentation/view models/habits/delete habit cubit/delete_habit_cubit.dart';
import '../../features/home/presentation/view models/habits/get habits cubit/get_habit_cubit.dart';
import '../../features/home/presentation/view models/habits/update habit cubit/update_habit_cubit.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      firestore: getIt.get<FirebaseFirestore>()));
  getIt.registerSingleton(
      TasksRepoImpl(TasksLocalDataSourceImpl(), TasksRemoteDataSourceImpl()));
  getIt.registerSingleton(HabitsRepoImpl(
      HabitsLocalDataSourceImpl(), HabitsRemoteDataSourceImpl()));

//////////////////////   Auth cubits     //////////////////////////////
  getIt.registerSingleton<InternetCheckCubit>(InternetCheckCubit());
  getIt.registerLazySingleton<LogInCubit>(
      () => LogInCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerLazySingleton<LogInAnoCubit>(
      () => LogInAnoCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerLazySingleton<LogOutCubit>(
      () => LogOutCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerLazySingleton<SignUpCubit>(
      () => SignUpCubit(getIt.get<AuthRepoImpl>()));
///////////////////////  tasks cubits   //////////////////////////////
  getIt.registerLazySingleton<AddTaskCubit>(
      () => AddTaskCubit(getIt.get<TasksRepoImpl>()));
  getIt.registerLazySingleton<UpdateTaskCubit>(
      () => UpdateTaskCubit(getIt.get<TasksRepoImpl>()));
  getIt.registerLazySingleton<GetTaskCubit>(
      () => GetTaskCubit(getIt.get<TasksRepoImpl>()));
  getIt.registerLazySingleton<DeleteTaskCubit>(
      () => DeleteTaskCubit(getIt.get<TasksRepoImpl>()));

/////////////////////////   habits cubits   //////////////////////////////
  getIt.registerLazySingleton<AddHabitCubit>(
      () => AddHabitCubit(getIt.get<HabitsRepoImpl>()));
  getIt.registerLazySingleton<UpdateHabitCubit>(
      () => UpdateHabitCubit(getIt.get<HabitsRepoImpl>()));
  getIt.registerLazySingleton<GetHabitCubit>(
      () => GetHabitCubit(getIt.get<HabitsRepoImpl>()));
  getIt.registerLazySingleton<DeleteHabitCubit>(
      () => DeleteHabitCubit(getIt.get<HabitsRepoImpl>()));

//////////////////////////  fav cubits   //////////////////////////////

  getIt.registerLazySingleton<FavouriteTasksCubit>(
      () => FavouriteTasksCubit(getIt.get<GetTaskCubit>()));
  getIt.registerLazySingleton<FavouriteHabitsCubit>(
      () => FavouriteHabitsCubit(getIt.get<GetHabitCubit>()));
///////////////////  work session cubits   //////////////////////////////
  getIt.registerFactory<WorkSessionCubit>(() => WorkSessionCubit());
  getIt.registerFactory<TimerCubit>(() => TimerCubit());
  //////////// search cubit ////////////////
  getIt.registerFactory<SearchCubit>(
      () => SearchCubit(getIt<TasksLocalDataSourceImpl>()));
}
