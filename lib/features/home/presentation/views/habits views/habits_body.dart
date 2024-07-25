import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/utils/habits%20utils/get_habits.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_habit_item.dart';

import '../widgets/custom_add_button.dart';

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
    return Column(
      children: [
        BlocBuilder<GetHabitCubit, GetHabitState>(
          builder: (context, state) {
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
                            habit: getIt.get<GetHabitCubit>().habits[index],
                          ));
                    },
                    itemCount: getIt.get<GetHabitCubit>().habits.length,
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
