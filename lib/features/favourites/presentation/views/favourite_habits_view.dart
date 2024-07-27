import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';
import '../widgets/favourite_habits_view_body.dart';

class FavouriteHabitsView extends StatelessWidget {
  const FavouriteHabitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: Text(
            AppTexts.favHabits,
            style: Styles.style18w600,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: const FavouriteHabitsViewBody());
  }
}
