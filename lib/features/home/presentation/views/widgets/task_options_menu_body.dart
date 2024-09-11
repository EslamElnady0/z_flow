import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/tasks%20utils/delete_task.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/tasks utils/update_task.dart';
import '../../../../../generated/l10n.dart';
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
              await updateTask(task: task);
            },
            title: S.of(context).favourite,
            icon: SvgPicture.asset(
              task.isFavourited ? Assets.starIcon : Assets.favStarOutLined,
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
                  .pushNamed(AppRouter.editTask, arguments: task);
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
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              deleteTask(task: task);
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
