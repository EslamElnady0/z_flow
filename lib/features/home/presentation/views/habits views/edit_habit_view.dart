import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/edit_habit_view_body.dart';

class EditHabitView extends StatelessWidget {
  const EditHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: EditHabitViewBody(),
    );
  }
}
