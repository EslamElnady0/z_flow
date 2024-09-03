import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';
import 'custom_task_category_item.dart';

class EditCategoryListViewBody extends StatelessWidget {
  final String category;
  final int index;
  const EditCategoryListViewBody(
      {super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          Divider(
            height: 2.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(AppTexts.easilyManageYourCategorizedTasks,
              style: Styles.style14w400),
          SizedBox(
            height: 12.h,
          ),
          TaskCategoryItem(
            index: index,
            onTap: () {
              Navigator.pop(context);
            },
            title: category,
            isEdit: true,
          ),
        ],
      ),
    );
  }
}
