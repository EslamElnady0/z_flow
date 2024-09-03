import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/styles/styles.dart';
import 'custom_task_category_item.dart';

class TasksCategoriesViewBody extends StatefulWidget {
  const TasksCategoriesViewBody({super.key});

  @override
  State<TasksCategoriesViewBody> createState() =>
      _TasksCategoriesViewBodyState();
}

class _TasksCategoriesViewBodyState extends State<TasksCategoriesViewBody> {
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
          Text(
            AppTexts.exploreYourTasksCategorize,
            style: Styles.style14w400,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return TaskCategoryItem(
                    index: index,
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.editCatList,
                          arguments: {
                            "title": Constants.taskCatsList[index],
                            "index": index
                          });
                    },
                    title: Constants.taskCatsList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 12.h,
                );
              },
              itemCount: Constants.taskCatsList.length,
            ),
          ),
          SizedBox(height: 24.h),
          CustomLightColorsGradientButton(
              text: AppTexts.addNewCategory,
              icon: Assets.addIcon,
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.addNewCat);
              }),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}
