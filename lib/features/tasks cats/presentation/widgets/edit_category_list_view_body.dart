import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';

class EditCategoryListViewBody extends StatelessWidget {
  const EditCategoryListViewBody({super.key});

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
        ],
      ),
    );
  }
}
