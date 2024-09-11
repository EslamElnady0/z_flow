import 'package:flutter/material.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';

import '../widgets/edit_goal_view_body.dart';

class EditGoalView extends StatelessWidget {
  const EditGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as GoalModel;
    return CustomScaffold(
      appBar: buildInnerPagesAppBar(text: S.of(context).editGoal),
      body: EditGoalViewBody(goal: args),
    );
  }
}
