import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/favourite_tasks_view_body.dart';

class FavouriteTasksView extends StatelessWidget {
  const FavouriteTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: FavouriteTasksViewBody(),
    );
  }
}
