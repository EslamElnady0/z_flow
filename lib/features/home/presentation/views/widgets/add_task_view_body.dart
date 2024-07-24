import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/utils/tasks%20utils/add_task.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/tasks utils/get_tasks.dart';
import '../../../data/models/task model/task_model.dart';
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
                BottomScreenActions(
                  otherButtonText: AppTexts.cancel,
                  onOtherButtonPressed: () => Navigator.of(context).pop(),
                  onSavePressed: () async {
                    if (formKey.currentState!.validate()) {
                      var box = Hive.box(Constants.constantsBox);
                      int id = box.get("id") ?? 0;
                      TaskModel task = TaskModel(
                        sideTask: subTaskController.text,
                        title: taskController.text,
                        notes: noteController.text,
                        id: id,
                        createdAt: DateTime.now().toString(),
                        deadline: endsInController.text,
                      );
                      await addTask(
                        task: task,
                      );
                      await getTasks();
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
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
