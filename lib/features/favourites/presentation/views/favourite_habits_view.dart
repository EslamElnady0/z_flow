import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../widgets/favourite_habits_view_body.dart';

class FavouriteHabitsView extends StatelessWidget {
  const FavouriteHabitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: FavouriteHabitsViewBody());
  }
}
