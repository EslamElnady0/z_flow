import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/tasks%20utils/add_task.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/tasks utils/get_tasks.dart';
import '../../../data/models/task model/task_model.dart';
import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import 'task_data_form.dart';

class AddTaskViewBody extends StatefulWidget {
  final String? category;

  const AddTaskViewBody({super.key, this.category});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
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
    taskController = TextEditingController();
    endsInController = TextEditingController();
    noteController = TextEditingController();
    subTaskOneController = TextEditingController();
    subTaskTwoController = TextEditingController();
    subTaskThreeController = TextEditingController();
    subTaskFourController = TextEditingController();
    subTaskFiveController = TextEditingController();
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
                      int id = box.get("tasksId") ?? 0;
                      TaskModel task = TaskModel(
                        sideTask: <String>[
                          subTaskOneController.text,
                          subTaskTwoController.text,
                          subTaskThreeController.text,
                          subTaskFourController.text,
                          subTaskFiveController.text
                        ],
                        title: taskController.text,
                        notes: noteController.text,
                        id: id,
                        createdAt: DateFormat.yMMMd().format(DateTime.now()),
                        deadline: endsInController.text,
                        category: widget.category == null
                            ? []
                            : <String>[widget.category!],
                      );
                      await addTask(
                        task: task,
                      );
                      if (widget.category != null) {
                        getIt
                            .get<GetTaskCubit>()
                            .getCategorizedTasks(widget.category!);
                      }
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
