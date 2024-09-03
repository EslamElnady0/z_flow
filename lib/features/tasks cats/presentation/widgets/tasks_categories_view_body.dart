import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';

import '../../../../core/styles/styles.dart';
import 'categories_bloc_builder.dart';

class TasksCategoriesViewBody extends StatelessWidget {
  const TasksCategoriesViewBody({super.key});

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
          const CategoriesBlocBuilder()
        ],
      ),
    );
  }
}
