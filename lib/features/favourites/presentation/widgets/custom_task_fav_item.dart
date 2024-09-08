import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/build_overlay_menu.dart';
import '../../../../core/utils/tasks utils/update_task.dart';
import '../../../home/data/models/task model/task_model.dart';
import '../../../home/presentation/views/widgets/task_options_menu_body.dart';
import '../../data/view models/favourite tasks cubit/favourite_tasks_cubit.dart';

class CustomTaskFavItem extends StatefulWidget {
  final GlobalKey actionKey;
  final TaskModel task;
  const CustomTaskFavItem({
    super.key,
    required this.actionKey,
    required this.task,
  });

  @override
  State<CustomTaskFavItem> createState() => _CustomTaskFavItemState();
}

class _CustomTaskFavItemState extends State<CustomTaskFavItem> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 17.w,
      ),
      GestureDetector(
        onTap: () async {
          widget.task.isFavourited = !widget.task.isFavourited;
          if (!widget.task.isFavourited) {
            context.read<FavouriteTasksCubit>().favTasks.remove(widget.task);
          }
          await updateTask(task: widget.task);
          if (context.mounted) {
            context.read<FavouriteTasksCubit>().getFavTasks();
          }
        },
        child: SvgPicture.asset(
          Assets.starStroke,
          width: 27.w,
          height: 27.h,
        ),
      ),
      SizedBox(
        width: 10.w,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 12.w),
          alignment: Alignment.centerLeft,
          height: 50.h,
          decoration: BoxDecoration(
              gradient: Constants.customItemsGradient,
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 220.w,
                child: Text(
                  widget.task.title,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16W600grey.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
              IconButton(
                key: widget.actionKey,
                onPressed: () {
                  BuildOverlayMenu.showOverlay(context, widget.actionKey,
                      widget: TaskOptionsMenuBody(task: widget.task));
                },
                icon: Icon(Icons.more_vert, color: Colors.black, size: 20.r),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        width: 17.w,
      ),
    ]);
  }
}
