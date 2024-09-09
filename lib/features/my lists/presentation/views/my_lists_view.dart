import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/my_lists_view_body.dart';

import '../../../../core/constants/app_texts.dart';

class MyListsView extends StatelessWidget {
  const MyListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildInnerPagesAppBar(text: AppTexts.myLists),
      body: const MyListsViewBody(),
    );
  }
}
