import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/home/presentation/views/widgets/ongoing_habits_view_all_row.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/routes/app_router.dart';
import 'custom_habit_item.dart';
import 'custom_light_colors_gradient_button.dart';

class NoEmptyHabitListEmpty extends StatelessWidget {
  final List onGoingHabits;
  final List doneHabits;
  const NoEmptyHabitListEmpty(
      {super.key, required this.onGoingHabits, required this.doneHabits});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HabitsViewAllRow(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.allHabits,
                  arguments: false);
            },
            text: AppTexts.habitsToAccomplishToday),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          flex: 3,
          child: ListView.separated(
            itemBuilder: (context, index) {
              GlobalKey actionKey = GlobalKey();
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 10.w),
                  child: CustomHabitItem(
                    actionKey: actionKey,
                    habit: onGoingHabits[index],
                  ));
            },
            itemCount: onGoingHabits.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        HabitsViewAllRow(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.allHabits,
                  arguments: true);
            },
            text: AppTexts.habitsYouCompletedToday),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            itemBuilder: (context, index) {
              GlobalKey actionKey = GlobalKey();
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 10.w),
                  child: CustomHabitItem(
                    actionKey: actionKey,
                    habit: doneHabits[index],
                  ));
            },
            itemCount: doneHabits.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w),
          child: CustomLightColorsGradientButton(
            icon: Assets.addIcon,
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
