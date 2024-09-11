import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/habits%20utils/delete_habit.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/habits utils/update_habit.dart';
import '../../../../../generated/l10n.dart';
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

              await updateHabit(habit: habit, context: context);
            },
            title: S.of(context).favourite,
            icon: SvgPicture.asset(
              habit.isFavourited ? Assets.starIcon : Assets.favStarOutLined,
              width: 18.w,
              height: 18.h,
              color: Colors.white,
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
            title: S.of(context).edit,
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
              await deleteHabit(habit: habit, context: context);
            },
            title: S.of(context).delete,
            icon: SvgPicture.asset(
              Assets.deleteIcon,
              width: 18.w,
              height: 18.h,
            )),
      ],
    );
  }
}
