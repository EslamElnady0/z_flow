import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';

import '../../../../core/widgets/build_custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/edit_reminder_view_body.dart';

class EditReminderView extends StatelessWidget {
  const EditReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as EventModel;
    return CustomScaffold(
      appBar: buildInnerPagesAppBar(text: S.of(context).editReminder),
      body: EditReminderViewBody(event: args),
    );
  }
}
