import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/tasks%20utils/add_task.dart';
import 'package:z_flow/core/utils/tasks%20utils/categories/get_tasks_categories.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/show_suggest_category_selection_dialog.dart';
import '../../../../../generated/l10n.dart';
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
  late TextEditingController categoryController;
  late TextEditingController subTaskOneController;
  late TextEditingController subTaskTwoController;
  late TextEditingController subTaskThreeController;
  late TextEditingController subTaskFourController;
  late TextEditingController subTaskFiveController;

  @override
  void initState() {
    getTasksCategories(context);
    taskController = TextEditingController();
    endsInController = TextEditingController();
    noteController = TextEditingController();
    subTaskOneController = TextEditingController();
    subTaskTwoController = TextEditingController();
    subTaskThreeController = TextEditingController();
    subTaskFourController = TextEditingController();
    subTaskFiveController = TextEditingController();
    categoryController = TextEditingController(text: widget.category ?? "");
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
    categoryController.dispose();

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
                taskController: taskController,
                endsInController: endsInController,
                noteController: noteController,
                categoryController: categoryController,
                subTaskControllers: [
                  subTaskOneController,
                  subTaskTwoController,
                  subTaskThreeController,
                  subTaskFourController,
                  subTaskFiveController
                ],
                text: S.of(context).easilyAddYourTasks,
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
                  otherButtonText: S.of(context).cancel,
                  onOtherButtonPressed: () => Navigator.of(context).pop(),
                  onPrimaryButtonPressed: () async {
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
                        createdAt:
                            DateFormat.yMMMd('en_US').format(DateTime.now()),
                        deadline: endsInController.text,
                        category: categoryController.text.split(", "),
                      );
                      if (categoryController.text.isEmpty ||
                          categoryController.text == "") {
                        showSuggestCategorySelectionDialog(
                            context, categoryController, task);
                      } else {
                        await addTask(
                          task: task,
                          context: context,
                        );
                        if (widget.category != null) {
                          getIt
                              .get<GetTaskCubit>()
                              .getCategorizedTasks(widget.category!);
                        }
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
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
