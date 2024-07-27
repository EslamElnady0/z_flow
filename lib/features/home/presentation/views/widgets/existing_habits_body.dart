import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_habit_item.dart';

class ExistingHabitsBody extends StatelessWidget {
  final BuildContext ctx;
  const ExistingHabitsBody({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppTexts.habitsToAccomplishToday,
          style: Styles.style16W600grey,
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 450.h,
          child: ListView.separated(
            itemBuilder: (context, index) {
              GlobalKey actionKey = GlobalKey();
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 10.w),
                  child: CustomHabitItem(
                    actionKey: actionKey,
                    habit: ctx.read<GetHabitCubit>().habits[index],
                  ));
            },
            itemCount: ctx.read<GetHabitCubit>().habits.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
          ),
        ),
      ],
    );
  }
}
