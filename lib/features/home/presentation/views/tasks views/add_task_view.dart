import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String?;
    return CustomScaffold(
      body: AddTaskViewBody(
        category: args,
      ),
      appBar: AppBar(
        title: Text(
          S.of(context).addNewTask,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
