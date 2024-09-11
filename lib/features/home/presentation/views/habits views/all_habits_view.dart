import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/all_habits_view_body.dart';

class AllHabitsView extends StatelessWidget {
  const AllHabitsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDoneHabits = ModalRoute.of(context)!.settings.arguments as bool;
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          isDoneHabits ? S.of(context).doneHabits : S.of(context).onGoingHabits,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: AllHabitsViewBody(
        isDoneHabits: isDoneHabits,
      ),
    );
  }
}
