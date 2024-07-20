import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/styles/styles.dart';
import '../widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const AddTaskViewBody(),
      appBar: AppBar(
        title: Text(
          AppTexts.addNewTask,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
