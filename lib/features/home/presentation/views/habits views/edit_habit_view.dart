import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/styles/styles.dart';
import '../../../data/models/habit model/habit_model.dart';
import '../widgets/edit_habit_view_body.dart';

class EditHabitView extends StatelessWidget {
  const EditHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    HabitModel habit = ModalRoute.of(context)!.settings.arguments as HabitModel;
    return CustomScaffold(
      body: EditHabitViewBody(habit: habit),
      appBar: AppBar(
        title: Text(
          AppTexts.editHabit,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
