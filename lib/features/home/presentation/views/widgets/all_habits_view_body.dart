import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_habits_filter_row.dart';

import '../../view models/habits/get habits cubit/get_habit_cubit.dart';
import 'all_habits_list_view.dart';

class AllHabitsViewBody extends StatelessWidget {
  final bool isDoneHabits;
  const AllHabitsViewBody({super.key, required this.isDoneHabits});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: 16.h,
          ),
          const CustomHabitsFilterRow(),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<GetHabitCubit, GetHabitState>(
            builder: (context, state) {
              return AllHabitsListView(isDoneHabits: isDoneHabits);
            },
          )
        ],
      ),
    );
  }
}
