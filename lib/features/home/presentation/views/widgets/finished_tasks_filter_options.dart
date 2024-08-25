import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/widgets/build_overlay_menu.dart';
import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import 'custom_pop_up_menu_item.dart';

class DurationFilterOptions extends StatelessWidget {
  const DurationFilterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPopUpMenuItem(
            onTap: () async {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetTaskCubit>().duration = const Duration(hours: 24);
              getIt.get<GetTaskCubit>().getRecentTasksFilter();
            },
            title: AppTexts.lastDay,
            icon: null),
        Divider(
          color: Colors.white,
          height: 25.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetTaskCubit>().duration =
                  const Duration(hours: 7 * 24);
              getIt.get<GetTaskCubit>().getRecentTasksFilter();
            },
            title: AppTexts.last7Days,
            icon: null),
        Divider(
          color: Colors.white,
          height: 25.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetTaskCubit>().duration =
                  const Duration(hours: 28 * 24);
              getIt.get<GetTaskCubit>().getRecentTasksFilter();
            },
            title: AppTexts.last28Days,
            icon: null),
        Divider(
          color: Colors.white,
          height: 25.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              getIt.get<GetTaskCubit>().duration = null;
              getIt.get<GetTaskCubit>().getRecentTasksFilter();
            },
            title: AppTexts.allFinishedTasks,
            icon: null),
      ],
    );
  }
}
