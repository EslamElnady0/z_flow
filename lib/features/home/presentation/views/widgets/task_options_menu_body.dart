import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/tasks%20utils/delete_task.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../../../../core/DI/service_locator.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/tasks utils/update_task.dart';
import '../../../../favourites/data/view models/favourite tasks cubit/favourite_tasks_cubit.dart';
import 'custom_pop_up_menu_item.dart';

class TaskOptionsMenuBody extends StatelessWidget {
  final TaskModel task;
  const TaskOptionsMenuBody({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPopUpMenuItem(
            onTap: () async {
              BuildOverlayMenu.removeOverlay();
              task.isFavourited = !task.isFavourited;
              if (task.isFavourited) {
                getIt.get<FavouriteTasksCubit>().favTasks.add(task);
              } else {
                getIt.get<FavouriteTasksCubit>().favTasks.remove(task);
              }
              await updateTask(task: task);
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
                  .pushNamed(AppRouter.editTask, arguments: task);
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
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              deleteTask(task: task);
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
