import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';
import '../../../../../core/DI/service_locator.dart';
import '../../../../../core/widgets/build_overlay_menu.dart';
import '../../../../../generated/l10n.dart';
import 'custom_pop_up_menu_item.dart';

class AllHabitsDurationOptions extends StatelessWidget {
  const AllHabitsDurationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPopUpMenuItem(
            onTap: () async {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetHabitCubit>().duration = const Duration(hours: 24);
              getIt.get<GetHabitCubit>().getRecentDoneHabitsFilter(
                  getIt.get<GetHabitCubit>().duration);
              getIt.get<GetHabitCubit>().getRecentOnGoingHabitsFilter();
            },
            title: S.of(context).lastDay,
            icon: null),
        Divider(
          color: Colors.white,
          height: 25.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetHabitCubit>().duration =
                  const Duration(hours: 7 * 24);
              getIt.get<GetHabitCubit>().getRecentDoneHabitsFilter(
                  getIt.get<GetHabitCubit>().duration);
              getIt.get<GetHabitCubit>().getRecentOnGoingHabitsFilter();
            },
            title: S.of(context).last7Days,
            icon: null),
        Divider(
          color: Colors.white,
          height: 25.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetHabitCubit>().duration =
                  const Duration(hours: 28 * 24);
              getIt.get<GetHabitCubit>().getRecentDoneHabitsFilter(
                  getIt.get<GetHabitCubit>().duration);
              getIt.get<GetHabitCubit>().getRecentOnGoingHabitsFilter();
            },
            title: S.of(context).last28Days,
            icon: null),
        Divider(
          color: Colors.white,
          height: 25.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetHabitCubit>().duration = null;
              getIt.get<GetHabitCubit>().getRecentDoneHabitsFilter(
                  getIt.get<GetHabitCubit>().duration);
              getIt.get<GetHabitCubit>().getRecentOnGoingHabitsFilter();
            },
            title: S.of(context).allFinishedTasks,
            icon: null),
      ],
    );
  }
}
