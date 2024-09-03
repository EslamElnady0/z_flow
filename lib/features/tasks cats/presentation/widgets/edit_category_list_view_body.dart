import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import 'categorized_tasks_body.dart';
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
          SizedBox(
            height: 12.h,
          ),
          CategorizedTasksBody(category: category),
          SizedBox(
            height: 20.h,
          ),
          CustomLightColorsGradientButton(
              text: AppTexts.addTaskToCategoryList,
              icon: Assets.addIcon,
              onTap: () {
                Navigator.pushNamed(context, AppRouter.addTask);
              }),
          SizedBox(
            height: 24.h,
          ),
          BottomScreenActions(
              onOtherButtonPressed: () {},
              onSavePressed: () {},
              otherButtonText: AppTexts.delete),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}
