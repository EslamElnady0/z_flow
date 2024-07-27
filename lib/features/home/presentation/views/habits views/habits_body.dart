import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';
import '../widgets/custom_add_button.dart';
import '../widgets/existing_habits_body.dart';
import '../widgets/no_habits_body.dart';

class HabitsBody extends StatelessWidget {
  const HabitsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetHabitCubit, GetHabitState>(
          builder: (context, state) {
            if (getIt.get<GetHabitCubit>().habits.isEmpty) {
              return const NoHabitsBody();
            }
            return ExistingHabitsBody(
              ctx: context,
            );
          },
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w),
          child: CustomAddButton(
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.addHabit);
            },
            text: AppTexts.addNewHabit,
          ),
        ),
        SizedBox(
          height: 104.h,
        )
      ],
    );
  }
}
