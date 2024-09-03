import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';
import '../widgets/edit_category_list_view_body.dart';

class EditCategoryListView extends StatelessWidget {
  const EditCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String category = arguments['title'] as String;
    int index = arguments['index'] as int;
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.editCategoryList,
          style: Styles.style18w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: EditCategoryListViewBody(category: category, index: index),
    );
  }
}
