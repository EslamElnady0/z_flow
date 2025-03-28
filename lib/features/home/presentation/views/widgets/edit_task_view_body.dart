import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/tasks%20utils/delete_task.dart';
import 'package:z_flow/core/utils/tasks%20utils/update_task.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';
import '../../../../../core/utils/tasks utils/categories/get_tasks_categories.dart';
import '../../../../../generated/l10n.dart';
import '../../../../tasks cats/presentation/view models/get tasks categories cubit/get_tasks_categories_cubit.dart';
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
  late TextEditingController categoryController;
  late TextEditingController subTaskOneController;
  late TextEditingController subTaskTwoController;
  late TextEditingController subTaskThreeController;
  late TextEditingController subTaskFourController;
  late TextEditingController subTaskFiveController;
  @override
  void initState() {
    getTasksCategories(context);

    taskController = TextEditingController(text: widget.task.title);
    endsInController = TextEditingController(text: widget.task.deadline);
    noteController = TextEditingController(text: widget.task.notes);
    categoryController =
        TextEditingController(text: widget.task.category.join(", "));
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
    categoryController.dispose();
    subTaskOneController.dispose();
    subTaskTwoController.dispose();
    subTaskThreeController.dispose();
    subTaskFourController.dispose();
    subTaskFiveController.dispose();
    if (getIt.isRegistered<GetTasksCategoriesCubit>()) {
      getIt<GetTasksCategoriesCubit>().close();
      getIt.unregister<GetTasksCategoriesCubit>();
    }
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
                categoryController: categoryController,
                endsInController: endsInController,
                noteController: noteController,
                subTaskControllers: [
                  subTaskOneController,
                  subTaskTwoController,
                  subTaskThreeController,
                  subTaskFourController,
                  subTaskFiveController
                ],
                text: S.of(context).easilyEditTasks,
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
                  onPrimaryButtonPressed: () async {
                    if (formKey.currentState!.validate()) {
                      widget.task.title = taskController.text;
                      widget.task.deadline = endsInController.text;
                      widget.task.notes = noteController.text;
                      widget.task.category =
                          categoryController.text.split(", ");
                      widget.task.sideTask = <String>[
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
                  otherButtonText: S.of(context).delete,
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
