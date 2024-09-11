import 'package:flutter/material.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/add_reminder_view_body.dart';

class AddReminderView extends StatelessWidget {
  const AddReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildInnerPagesAppBar(text: S.of(context).reminder),
      body: const AddReminderViewBody(),
    );
  }
}
