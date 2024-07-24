import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/add%20task%20cubit/add_task_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/calender_body.dart';
import 'package:z_flow/features/home/presentation/views/habits%20views/habits_body.dart';
import 'package:z_flow/features/home/presentation/views/widgets/profile_body.dart';
import 'package:z_flow/features/home/presentation/views/time%20management%20views/time_management_body.dart';
import '../tasks views/tasks_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        switch (context.read<BottomNavBarCubit>().selectedIndex) {
          case 0:
            return BlocProvider(
              create: (context) => getIt.get<AddTaskCubit>(),
              child: const TasksBody(),
            );
          case 1:
            return BlocProvider.value(
              value: getIt.get<AddTaskCubit>(),
              child: const CalenderBody(),
            );
          case 2:
            return const TimeManagementBody();
          case 3:
            return const HabitsBody();
          case 4:
            return MultiBlocProvider(providers: [
              //TODO : ADD TASKS, HABITS AND AUTH CUBIT ?(IDK ABOUT LAST ONE)
            ], child: const ProfileBody());
          default:
            return const Placeholder();
        }
      },
    );
  }
}
