import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/features/auth/data/repos/auth_repo_impl.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_local_data_source.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_remote_data_source.dart';
import 'package:z_flow/features/home/data/repos/tasks%20repo/tasks_repo_impl.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/add%20task%20cubit/add_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/delete%20task%20cubit/delete_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/update%20task%20cubit/update_task_cubit.dart';

import '../../features/auth/presentation/view models/sign up cubit/sign_up_cubit.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      firestore: getIt.get<FirebaseFirestore>()));
  getIt.registerSingleton(
      TasksRepoImpl(TasksLocalDataSourceImpl(), TasksRemoteDataSourceImpl()));

//////////////////////   Auth cubits     //////////////////////////////
  getIt.registerSingleton<InternetCheckCubit>(InternetCheckCubit());
  getIt.registerLazySingleton<LogInCubit>(
      () => LogInCubit(getIt.get<AuthRepoImpl>()));
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

/////////////////////////
}
