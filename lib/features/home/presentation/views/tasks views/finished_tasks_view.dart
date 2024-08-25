import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/finished_tasks_view_body.dart';

class FinishedTasksView extends StatelessWidget {
  const FinishedTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: FinishedTasksViewBody(),
    );
  }
}
