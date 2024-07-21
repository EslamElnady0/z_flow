import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/styles/styles.dart';
import '../widgets/add_habit_view_body.dart';

class AddHabitView extends StatelessWidget {
  const AddHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const AddHabitViewBody(),
      appBar: AppBar(
        title: Text(
          AppTexts.addNewHabit,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
