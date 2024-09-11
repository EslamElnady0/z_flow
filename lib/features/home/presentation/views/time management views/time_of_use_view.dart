import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/time_of_use_view_body.dart';

class TimeOfUseView extends StatelessWidget {
  const TimeOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).timeOfUse,
            style: Styles.style18w600,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: const TimeOfUseViewBody());
  }
}
