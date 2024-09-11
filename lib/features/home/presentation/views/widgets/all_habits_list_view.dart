import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/habits%20utils/get_duration_text_habits.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_habit_item.dart';

import '../../../../../core/styles/styles.dart';

class AllHabitsListView extends StatelessWidget {
  final bool isDoneHabits;
  const AllHabitsListView({super.key, required this.isDoneHabits});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getDurationTextHabits(
                isDoneHabits: isDoneHabits,
                context: context,
                duration: getIt.get<GetHabitCubit>().duration),
            style: Styles.style18w600,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                GlobalKey actionKey = GlobalKey();
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    child: CustomHabitItem(
                      actionKey: actionKey,
                      habit: isDoneHabits
                          ? getIt.get<GetHabitCubit>().recentDoneHabits[index]
                          : getIt
                              .get<GetHabitCubit>()
                              .recentOnGoingHabits[index],
                    ));
              },
              itemCount: isDoneHabits
                  ? getIt.get<GetHabitCubit>().recentDoneHabits.length
                  : getIt.get<GetHabitCubit>().recentOnGoingHabits.length,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.h,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
