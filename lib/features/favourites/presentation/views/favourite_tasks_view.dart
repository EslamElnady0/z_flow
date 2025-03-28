import 'package:flutter/material.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../core/styles/styles.dart';
import '../widgets/favourite_tasks_view_body.dart';

class FavouriteTasksView extends StatelessWidget {
  const FavouriteTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).favTasks,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const FavouriteTasksViewBody(),
    );
  }
}
