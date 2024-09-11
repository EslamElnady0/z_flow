import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_habit_item.dart';
import 'package:z_flow/features/home/presentation/views/widgets/ongoing_habits_view_all_row.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/routes/app_router.dart';
import 'custom_light_colors_gradient_button.dart';

class OneHabitListEmpty extends StatelessWidget {
  final List<HabitModel> habits;
  final String text;
  final bool isDoneHabits;
  const OneHabitListEmpty(
      {super.key,
      required this.habits,
      required this.text,
      required this.isDoneHabits});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HabitsViewAllRow(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.allHabits,
                  arguments: isDoneHabits);
            },
            text: text),
        SizedBox(
          height: 16.h,
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
                    habit: habits[index],
                  ));
            },
            itemCount: habits.length,
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
            text: S.of(context).addNewHabit,
          ),
        ),
        SizedBox(
          height: 104.h,
        )
      ],
    );
  }
}
