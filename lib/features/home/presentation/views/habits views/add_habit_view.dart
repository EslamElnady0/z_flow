import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/add_habit_view_body.dart';

class AddHabitView extends StatelessWidget {
  const AddHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: AddHabitViewBody(),
    );
  }
}
