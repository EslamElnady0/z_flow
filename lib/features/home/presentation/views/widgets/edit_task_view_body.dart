import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import '../../../../../core/constants/app_texts.dart';
import 'task_data_form.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key});

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
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
                SaveCancelActionsRow(
                  onSavePressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
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
