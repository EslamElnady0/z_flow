import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/utils/tasks%20utils/delete_task.dart';
import 'package:z_flow/core/utils/tasks%20utils/update_task.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import '../../../../../core/constants/app_texts.dart';
import 'task_data_form.dart';

class EditTaskViewBody extends StatefulWidget {
  final TaskModel task;
  const EditTaskViewBody({super.key, required this.task});

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController taskController;
  late TextEditingController endsInController;
  late TextEditingController noteController;
  late TextEditingController subTaskOneController;
  late TextEditingController subTaskTwoController;
  late TextEditingController subTaskThreeController;
  late TextEditingController subTaskFourController;
  late TextEditingController subTaskFiveController;
  @override
  void initState() {
    taskController = TextEditingController(text: widget.task.title);
    endsInController = TextEditingController(text: widget.task.deadline);
    noteController = TextEditingController(text: widget.task.notes);
    subTaskOneController = TextEditingController(text: widget.task.sideTask[0]);
    subTaskTwoController = TextEditingController(text: widget.task.sideTask[1]);
    subTaskThreeController =
        TextEditingController(text: widget.task.sideTask[2]);
    subTaskFourController =
        TextEditingController(text: widget.task.sideTask[3]);
    subTaskFiveController =
        TextEditingController(text: widget.task.sideTask[4]);

    super.initState();
  }

  @override
  void dispose() {
    taskController.dispose();
    endsInController.dispose();
    noteController.dispose();
    subTaskOneController.dispose();
    subTaskTwoController.dispose();
    subTaskThreeController.dispose();
    subTaskFourController.dispose();
    subTaskFiveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: TaskDataForm(
                task: widget.task,
                taskController: taskController,
                endsInController: endsInController,
                noteController: noteController,
                subTaskControllers: [
                  subTaskOneController,
                  subTaskTwoController,
                  subTaskThreeController,
                  subTaskFourController,
                  subTaskFiveController
                ],
                text: AppTexts.easilyEditTasks,
                isEdit: true,
                formKey: formKey),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
                const Spacer(),
                BottomScreenActions(
                  onSavePressed: () async {
                    if (formKey.currentState!.validate()) {
                      widget.task.title = taskController.text;
                      widget.task.deadline = endsInController.text;
                      widget.task.notes = noteController.text;
                      widget.task.sideTask = [
                        subTaskOneController.text,
                        subTaskTwoController.text,
                        subTaskThreeController.text,
                        subTaskFourController.text,
                        subTaskFiveController.text
                      ];
                      formKey.currentState!.save();
                      await updateTask(task: widget.task);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  onOtherButtonPressed: () async {
                    await deleteTask(task: widget.task);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  otherButtonText: AppTexts.delete,
                ),
                SizedBox(
                  height: 60.h,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
