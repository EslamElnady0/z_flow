import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/tasks%20cats/presentation/widgets/tasks_categories_view_body.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';

class TasksCategoriesView extends StatelessWidget {
  const TasksCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).taskClassifications,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const TasksCategoriesViewBody(),
    );
  }
}
