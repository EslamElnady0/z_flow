import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_task_item.dart';

import 'custom_calender.dart';

class CalenderBody extends StatelessWidget {
  const CalenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(
            AppTexts.gregorianCalendar,
            style: Styles.style16W600grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          Image.asset(
            Assets.calenderImage,
            width: 262.w,
            height: 191.h,
          ),
          const CustomCalender(),
          SizedBox(
            height: 16.h,
          ),
          Text(
            AppTexts.yourTasksForThatDay,
            style: Styles.style16W600grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 350.h,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const CustomTaskItem(),
              itemCount: 5,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.h,
                );
              },
            ),
          ),
          SizedBox(
            height: 74.h,
          )
        ],
      ),
    );
  }
}
