import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/utils/tasks%20utils/add_task.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import '../../../../../core/constants/app_texts.dart';
import 'task_data_form.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController taskController;
  late TextEditingController endsInController;
  late TextEditingController noteController;
  late TextEditingController subTaskController;

  @override
  void initState() {
    taskController = TextEditingController();
    endsInController = TextEditingController();
    noteController = TextEditingController();
    subTaskController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    taskController.dispose();
    endsInController.dispose();
    noteController.dispose();
    subTaskController.dispose();
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
                taskController: taskController,
                endsInController: endsInController,
                noteController: noteController,
                subTaskController: subTaskController,
                text: AppTexts.easilyAddYourTasks,
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
                SaveCancelActionsRow(
                  onSavePressed: () {
                    if (formKey.currentState!.validate()) {
                      addTask(
                          context: context,
                          taskController: taskController,
                          subTaskController: subTaskController,
                          noteController: noteController,
                          endsInController: endsInController);
                    }
                  },
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
