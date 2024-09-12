import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';
import 'package:z_flow/features/goals/data/data%20sources/goals_local_data_source.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';
import 'package:z_flow/features/home/data/data%20sources/habits/habits_local_data_source.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_local_data_source.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_remote_data_source.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/bottom%20nav%20bar%20cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/delete%20habit%20cubit/delete_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/update%20habit%20cubit/update_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/delete%20task%20cubit/delete_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/update%20task%20cubit/update_task_cubit.dart';
import 'package:z_flow/features/home/presentation/views/calender%20view/calender_body.dart';
import 'package:z_flow/features/home/presentation/views/habits%20views/habits_body.dart';
import 'package:z_flow/features/home/presentation/views/profile%20view/profile_body.dart';
import 'package:z_flow/features/home/presentation/views/time%20management%20views/time_management_body.dart';
import 'package:z_flow/features/my%20lists/data/data%20sources/links_lists_local_data_source.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';
import 'package:z_flow/features/tasks%20cats/data/data%20sources/task_cats_local_data_source.dart';
import '../../../../goals/data/data sources/goals_remote_data_source.dart';
import '../../../../my lists/data/data sources/links_lists_remote_data_source.dart';
import '../../../../reminder/data/data sources/events_local_data_source.dart';
import '../../../../reminder/data/data sources/events_remote_data_source.dart';
import '../../../../tasks cats/data/data sources/task_cats_remote_data_source.dart';
import '../../../data/data sources/habits/habits_remote_data_source.dart';
import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import '../tasks views/tasks_body.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    syncData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        switch (context.read<BottomNavBarCubit>().selectedIndex) {
          case 0:
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<DeleteTaskCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<UpdateTaskCubit>(),
                ),
                BlocProvider(create: (context) => getIt<UpdateHabitCubit>())
              ],
              child: const TasksBody(),
            );
          case 1:
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: getIt.get<GetTaskCubit>()
                    ..getSpecificDayTasks(DateTime.now()),
                ),
                BlocProvider(
                  create: (context) => getIt<DeleteTaskCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt.get<UpdateTaskCubit>(),
                ),
              ],
              child: const CalenderBody(),
            );
          case 2:
            return const TimeManagementBody();
          case 3:
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<DeleteHabitCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<UpdateHabitCubit>(),
                ),
              ],
              child: const HabitsBody(),
            );
          case 4:
            return BlocProvider(
              create: (context) => getIt<LogInCubit>(),
              child: const ProfileBody(),
            );
          default:
            return const Placeholder();
        }
      },
    );
  }
}

syncData() async {
  if (getIt.get<FirebaseAuth>().currentUser != null &&
      !getIt.get<FirebaseAuth>().currentUser!.isAnonymous &&
      getIt.get<InternetCheckCubit>().isDeviceConnected) {
    log('Syncing data......');
    List<TaskModel> tasks = TasksLocalDataSourceImpl().getTasks() ?? [];
    List<HabitModel> habits = HabitsLocalDataSourceImpl().getHabits() ?? [];
    List<EventModel> events = EventsLocalDataSourceImpl().getEvents();
    List<GoalModel> goals = GoalsLocalDataSourceImpl().getGoals();
    List<LinksListModel> lists =
        LinksListsLocalDataSourceImpl().getLinksLists();
    List<String> tasksCats = TaskCatsLocalDataSourceImpl().getTaskCats();

    for (var task in tasks) {
      TasksRemoteDataSourceImpl()
          .addTask(task: task, uid: getIt.get<FirebaseAuth>().currentUser!.uid);
    }

    for (var habit in habits) {
      HabitsRemoteDataSourceImpl().addHabit(
          habit: habit, uid: getIt.get<FirebaseAuth>().currentUser!.uid);
    }

    for (var event in events) {
      EventsRemoteDataSourceImpl().addEvent(
        event,
      );
    }

    for (var goal in goals) {
      GoalsRemoteDataSourceImpl().addGoal(goal);
    }

    for (var list in lists) {
      LinksListsRemoteDataSourceImpl().addLinksList(list);
    }

    for (var taskCat in tasksCats) {
      TaskCatsRemoteDataSourceImpl().addTaskCats(taskCat);
    }
    log('........Finished Syncing data');
  }
}
