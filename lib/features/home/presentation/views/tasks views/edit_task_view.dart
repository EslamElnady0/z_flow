import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/styles/styles.dart';
import '../widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    TaskModel task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.editTask,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: EditTaskViewBody(task: task),
    );
  }
}
