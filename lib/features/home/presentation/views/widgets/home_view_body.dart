import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/features/home/presentation/ui%20cubits/cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/calender_body.dart';
import 'package:z_flow/features/home/presentation/views/widgets/habits_body.dart';
import 'package:z_flow/features/home/presentation/views/widgets/profile_body.dart';
import 'package:z_flow/features/home/presentation/views/widgets/time_management_body.dart';
import 'tasks_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        switch (context.read<BottomNavBarCubit>().selectedIndex) {
          case 0:
            return const TasksBody();
          case 1:
            return const CalenderBody();
          case 2:
            return const TimeManagementBody();
          case 3:
            return const HabitsBody();
          case 4:
            return const ProfileBody();
          default:
            return const Placeholder();
        }
      },
    );
  }
}
