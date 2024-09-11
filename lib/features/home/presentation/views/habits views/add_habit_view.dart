import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../../core/styles/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/add_habit_view_body.dart';

class AddHabitView extends StatelessWidget {
  const AddHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const AddHabitViewBody(),
      appBar: AppBar(
        title: Text(
          S.of(context).addNewHabit,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
