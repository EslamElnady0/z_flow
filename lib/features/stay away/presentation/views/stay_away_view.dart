import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/stay_away_view_body.dart';

class StayAwayView extends StatelessWidget {
  const StayAwayView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: StayAwayViewBody(),
    );
  }
}
