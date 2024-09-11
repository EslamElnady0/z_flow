import 'package:flutter/material.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/goals/presentation/widgets/goals_view_body.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: const GoalsViewBody(),
        appBar: buildInnerPagesAppBar(
          text: S.of(context).myGoals,
        ));
  }
}
