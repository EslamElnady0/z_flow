import 'package:flutter/material.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/reminder_view_body.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildInnerPagesAppBar(text: AppTexts.reminder),
      body: const ReminderViewBody(),
    );
  }
}
