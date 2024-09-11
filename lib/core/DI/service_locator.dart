import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/features/auth/data/repos/auth_repo_impl.dart';
import 'package:z_flow/features/auth/presentation/view%20models/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20ano%20cubit/log_in_ano_cubit.dart';
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
import 'package:z_flow/features/my%20lists/data/repo/links_lists_repo_impl.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/get%20links%20lists%20cubit/get_links_lists_cubit.dart';
import 'package:z_flow/features/reminder/data/repo/events_repo_impl.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/delete%20event%20cubit/delete_event_cubit.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/update%20event%20cubit/update_event_cubit.dart';
import 'package:z_flow/features/search/search%20cubit/search_cubit.dart';
import 'package:z_flow/features/tasks%20cats/data/data%20sources/task_cats_local_data_source.dart';
import 'package:z_flow/features/tasks%20cats/data/repos/task_cats_repo_impl.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/add%20tasks%20category%20cubit/add_tasks_category_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/delete%20task%20category%20cubit/delete_task_category_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/timer%20cubit/timer_cubit.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/work%20session%20cubit/work_session_cubit.dart';

import '../../features/auth/presentation/view models/sign up cubit/sign_up_cubit.dart';
import '../../features/goals/data/data sources/goals_local_data_source.dart';
import '../../features/goals/data/data sources/goals_remote_data_source.dart';
import '../../features/goals/data/repo/goals_repo_impl.dart';
import '../../features/goals/presentation/view models/add goal cubit/add_goal_cubit.dart';
import '../../features/goals/presentation/view models/delete goal cubit/delete_goal_cubit.dart';
import '../../features/goals/presentation/view models/edit goal cubit/edit_goal_cubit.dart';
import '../../features/goals/presentation/view models/get goals cubit/get_goals_cubit.dart';
import '../../features/home/data/repos/habits repo/habits_repo_impl.dart';
import '../../features/home/presentation/view models/habits/add habit cubit/add_habits_cubit.dart';
import '../../features/home/presentation/view models/habits/delete habit cubit/delete_habit_cubit.dart';
import '../../features/home/presentation/view models/habits/get habits cubit/get_habit_cubit.dart';
import '../../features/home/presentation/view models/habits/update habit cubit/update_habit_cubit.dart';
import '../../features/my lists/data/data sources/links_lists_local_data_source.dart';
import '../../features/my lists/data/data sources/links_lists_remote_data_source.dart';
import '../../features/my lists/presentation/view models/add links list cubit/add_links_list_cubit.dart';
import '../../features/my lists/presentation/view models/update links list cubit/update_links_list_cubit.dart';
import '../../features/reminder/data/data sources/events_local_data_source.dart';
import '../../features/reminder/data/data sources/events_remote_data_source.dart';
import '../../features/reminder/presentation/view models/add event cubit/add_event_cubit.dart';
import '../../features/reminder/presentation/view models/get events cubit/get_events_cubit.dart';
import '../../features/tasks cats/data/data sources/task_cats_remote_data_source.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      firestore: getIt.get<FirebaseFirestore>()));
  getIt.registerSingleton(
      TasksRepoImpl(TasksLocalDataSourceImpl(), TasksRemoteDataSourceImpl()));
  getIt.registerSingleton(HabitsRepoImpl(
      HabitsLocalDataSourceImpl(), HabitsRemoteDataSourceImpl()));

//////////////////////   Auth cubits     //////////////////////////////
  getIt.registerSingleton<InternetCheckCubit>(InternetCheckCubit());
  getIt
      .registerFactory<LogInCubit>(() => LogInCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerFactory<LogInAnoCubit>(
      () => LogInAnoCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerFactory<LogOutCubit>(
      () => LogOutCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerFactory<SignUpCubit>(
      () => SignUpCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt.get<AuthRepoImpl>()));
///////////////////////  tasks cubits   //////////////////////////////
  getIt.registerFactory<AddTaskCubit>(
      () => AddTaskCubit(getIt.get<TasksRepoImpl>()));
  getIt.registerFactory<UpdateTaskCubit>(
      () => UpdateTaskCubit(getIt.get<TasksRepoImpl>()));
  getIt.registerLazySingleton<GetTaskCubit>(
      () => GetTaskCubit(getIt.get<TasksRepoImpl>()));
  getIt.registerFactory<DeleteTaskCubit>(
      () => DeleteTaskCubit(getIt.get<TasksRepoImpl>()));

/////////////////////////   habits cubits   //////////////////////////////
  getIt.registerFactory<AddHabitCubit>(
      () => AddHabitCubit(getIt.get<HabitsRepoImpl>()));
  getIt.registerFactory<UpdateHabitCubit>(
      () => UpdateHabitCubit(getIt.get<HabitsRepoImpl>()));
  getIt.registerLazySingleton<GetHabitCubit>(
      () => GetHabitCubit(getIt.get<HabitsRepoImpl>()));
  getIt.registerFactory<DeleteHabitCubit>(
      () => DeleteHabitCubit(getIt.get<HabitsRepoImpl>()));

//////////////////////////  fav cubits   //////////////////////////////

  getIt.registerFactory<FavouriteTasksCubit>(
      () => FavouriteTasksCubit(getIt.get<GetTaskCubit>()));
  getIt.registerFactory<FavouriteHabitsCubit>(
      () => FavouriteHabitsCubit(getIt.get<GetHabitCubit>()));
///////////////////  work session cubits   //////////////////////////////
  getIt.registerFactory<WorkSessionCubit>(() => WorkSessionCubit());
  getIt.registerFactory<TimerCubit>(() => TimerCubit());
  //////////// search cubit ////////////////
  getIt.registerFactory<SearchCubit>(() =>
      SearchCubit(TasksLocalDataSourceImpl(), HabitsLocalDataSourceImpl()));

  ////////////  task cats cubit ////////////////

  getIt.registerSingleton(TaskCatsRepoImpl(
      taskCatsLocalDataSource: TaskCatsLocalDataSourceImpl(),
      taskCatsRemoteDataSource: TaskCatsRemoteDataSourceImpl()));
  getIt.registerLazySingleton<GetTasksCategoriesCubit>(() =>
      GetTasksCategoriesCubit(taskCatsRepo: getIt.get<TaskCatsRepoImpl>()));
  getIt.registerFactory<AddTasksCategoryCubit>(
      () => AddTasksCategoryCubit(taskCatsRepo: getIt.get<TaskCatsRepoImpl>()));
  getIt.registerFactory<DeleteTaskCategoryCubit>(() =>
      DeleteTaskCategoryCubit(taskCatsRepo: getIt.get<TaskCatsRepoImpl>()));

///////////////// goals cubits /////////////////
  getIt.registerLazySingleton<GoalsRepoImpl>(() => GoalsRepoImpl(
      goalsLocalDataSource: GoalsLocalDataSourceImpl(),
      goalsRemoteDataSource: GoalsRemoteDataSourceImpl()));
  getIt.registerLazySingleton<GetGoalsCubit>(
      () => GetGoalsCubit(goalsRepo: getIt.get<GoalsRepoImpl>()));
  getIt.registerFactory<AddGoalCubit>(
      () => AddGoalCubit(goalsRepo: getIt.get<GoalsRepoImpl>()));
  getIt.registerFactory<DeleteGoalCubit>(
      () => DeleteGoalCubit(goalsRepo: getIt.get<GoalsRepoImpl>()));
  getIt.registerFactory<EditGoalCubit>(
      () => EditGoalCubit(goalsRepo: getIt.get<GoalsRepoImpl>()));

//////////////////  events cubits /////////////////
  getIt.registerLazySingleton<EventsRepoImpl>(() => EventsRepoImpl(
      eventsLocalDataSource: EventsLocalDataSourceImpl(),
      eventsRemoteDataSource: EventsRemoteDataSourceImpl()));

  getIt.registerLazySingleton<GetEventsCubit>(
      () => GetEventsCubit(eventsRepo: getIt.get<EventsRepoImpl>()));
  getIt.registerFactory<AddEventCubit>(
      () => AddEventCubit(eventsRepo: getIt.get<EventsRepoImpl>()));
  getIt.registerFactory<DeleteEventCubit>(
      () => DeleteEventCubit(eventsRepo: getIt.get<EventsRepoImpl>()));
  getIt.registerFactory<UpdateEventCubit>(
      () => UpdateEventCubit(eventsRepo: getIt.get<EventsRepoImpl>()));

  ///////////////////// links lists cubits ////////////////////////
  getIt.registerLazySingleton<LinksListsRepoImpl>(() => LinksListsRepoImpl(
      linksListsLocalDataSource: LinksListsLocalDataSourceImpl(),
      linksListsRemoteDataSource: LinksListsRemoteDataSourceImpl()));

  getIt.registerLazySingleton<GetLinksListsCubit>(() =>
      GetLinksListsCubit(linksListsRepo: getIt.get<LinksListsRepoImpl>()));

  getIt.registerFactory<AddLinksListCubit>(
      () => AddLinksListCubit(linksListsRepo: getIt.get<LinksListsRepoImpl>()));

  getIt.registerFactory<UpdateLinksListCubit>(() =>
      UpdateLinksListCubit(linksListsRepo: getIt.get<LinksListsRepoImpl>()));
}
