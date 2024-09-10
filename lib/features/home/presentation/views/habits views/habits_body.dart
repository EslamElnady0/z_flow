import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/utils/habits%20utils/get_habits.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/no_empty_habit_list_empty.dart';
import '../widgets/one_habit_list_empty.dart';
import '../widgets/no_habits_body.dart';

class HabitsBody extends StatefulWidget {
  const HabitsBody({super.key});

  @override
  State<HabitsBody> createState() => _HabitsBodyState();
}

class _HabitsBodyState extends State<HabitsBody> {
  @override
  void initState() {
    getHabits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHabitCubit, GetHabitState>(
      builder: (context, state) {
        if (getIt.get<GetHabitCubit>().habits.isEmpty) {
          return const NoHabitsBody();
        } else if (getIt.get<GetHabitCubit>().onGoinghabits.isNotEmpty &&
            getIt.get<GetHabitCubit>().doneHabits.isEmpty) {
          return OneHabitListEmpty(
            habits: context.read<GetHabitCubit>().onGoinghabits,
            text: AppTexts.habitsToAccomplishToday,
            isDoneHabits: false,
          );
        } else if (getIt.get<GetHabitCubit>().onGoinghabits.isEmpty &&
            getIt.get<GetHabitCubit>().doneHabits.isNotEmpty) {
          return OneHabitListEmpty(
            habits: context.read<GetHabitCubit>().todaysDoneHabits,
            text: AppTexts.habitsYouCompletedToday,
            isDoneHabits: true,
          );
        } else {
          return NoEmptyHabitListEmpty(
            onGoingHabits: context.read<GetHabitCubit>().onGoinghabits,
            doneHabits: context.read<GetHabitCubit>().todaysDoneHabits,
          );
        }
      },
    );
  }
}
