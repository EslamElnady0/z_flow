import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/habits%20utils/delete_habit.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';

import '../../../../../core/DI/service_locator.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/habits utils/update_habit.dart';
import '../../../../favourites/data/view models/favourite habits cubit/favourite_habits_cubit.dart';
import 'custom_pop_up_menu_item.dart';

class HabitOptionsMenuBody extends StatelessWidget {
  final HabitModel habit;
  const HabitOptionsMenuBody({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPopUpMenuItem(
            onTap: () async {
              BuildOverlayMenu.removeOverlay();
              habit.isFavourited = !habit.isFavourited;
              if (habit.isFavourited) {
                getIt.get<FavouriteHabitsCubit>().favHabits.add(habit);
              } else {
                getIt.get<FavouriteHabitsCubit>().favHabits.remove(habit);
              }
              await updateHabit(habit: habit);
            },
            title: AppTexts.favourite,
            icon: SvgPicture.asset(
              Assets.starIcon,
              width: 18.w,
              height: 18.h,
            )),
        SizedBox(
          height: 20.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();

              Navigator.of(context)
                  .pushNamed(AppRouter.editHabit, arguments: habit);
            },
            title: AppTexts.edit,
            icon: SvgPicture.asset(
              Assets.settingsIcon,
              width: 18.w,
              height: 18.h,
            )),
        SizedBox(
          height: 20.h,
        ),
        CustomPopUpMenuItem(
            onTap: () async {
              BuildOverlayMenu.removeOverlay();
              await deleteHabit(habit: habit);
            },
            title: AppTexts.delete,
            icon: SvgPicture.asset(
              Assets.deleteIcon,
              width: 18.w,
              height: 18.h,
            )),
      ],
    );
  }
}
