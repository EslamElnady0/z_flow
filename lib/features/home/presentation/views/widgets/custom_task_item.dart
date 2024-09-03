import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/tasks%20utils/update_task.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/build_overlay_menu.dart';
import '../../../data/models/task model/task_model.dart';
import 'task_options_menu_body.dart';

class CustomTaskItem extends StatefulWidget {
  final GlobalKey actionKey;
  final TaskModel task;
  final String? category;
  const CustomTaskItem({
    super.key,
    required this.actionKey,
    required this.task,
    this.category,
  });

  @override
  State<CustomTaskItem> createState() => _CustomTaskItemState();
}

class _CustomTaskItemState extends State<CustomTaskItem> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomCheckBox(
        value: widget.task.isDone,
        onChanged: (value) async {
          widget.task.isDone = !(widget.task.isDone);
          widget.task.doneAt =
              widget.task.isDone ? DateTime.now().toString() : "";
          await updateTask(task: widget.task);
          if (widget.category != null) {
            getIt.get<GetTaskCubit>().getCategorizedTasks(widget.category!);
          }
        },
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
      )
    ]);
  }
}
