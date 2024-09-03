import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/features/tasks%20cats/presentation/widgets/one_task_list_empty.dart';

import '../../../home/data/models/task model/task_model.dart';

class NoEmptyTaskList extends StatelessWidget {
  final List<TaskModel> onGoingTasks;
  final List<TaskModel> doneTasks;
  final String category;

  const NoEmptyTaskList(
      {super.key,
      required this.onGoingTasks,
      required this.doneTasks,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          OneTaskListEmpty(
            category: category,
            tasks: onGoingTasks,
            text: AppTexts.onGoingTasks,
          ),
          SizedBox(
            height: 16.h,
          ),
          OneTaskListEmpty(
            tasks: doneTasks,
            category: category,
            text: AppTexts.tasksFinished,
          ),
        ],
      ),
    );
  }
}
