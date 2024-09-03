import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/features/tasks%20cats/presentation/widgets/one_task_list_empty.dart';

import '../../../home/data/models/task model/task_model.dart';

class NoEmptyTaskList extends StatelessWidget {
  final List<TaskModel> onGoingTasks;
  final List<TaskModel> doneTasks;

  const NoEmptyTaskList(
      {super.key, required this.onGoingTasks, required this.doneTasks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          OneTaskListEmpty(
              tasks: onGoingTasks,
              text: AppTexts.onGoingTasks,
              isDoneTasks: false),
          SizedBox(
            height: 16.h,
          ),
          OneTaskListEmpty(
              tasks: doneTasks,
              text: AppTexts.tasksFinished,
              isDoneTasks: true),
        ],
      ),
    );
  }
}
