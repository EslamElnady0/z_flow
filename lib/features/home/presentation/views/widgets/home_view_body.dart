import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/bottom%20nav%20bar%20cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/delete%20habit%20cubit/delete_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/update%20habit%20cubit/update_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/delete%20task%20cubit/delete_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/update%20task%20cubit/update_task_cubit.dart';
import 'package:z_flow/features/home/presentation/views/calender%20view/calender_body.dart';
import 'package:z_flow/features/home/presentation/views/habits%20views/habits_body.dart';
import 'package:z_flow/features/home/presentation/views/profile%20view/profile_body.dart';
import 'package:z_flow/features/home/presentation/views/time%20management%20views/time_management_body.dart';
import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import '../tasks views/tasks_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
            return const ProfileBody();
          default:
            return const Placeholder();
        }
      },
    );
  }
}
