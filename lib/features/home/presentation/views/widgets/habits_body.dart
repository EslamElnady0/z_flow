import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';

import 'custom_add_button.dart';
import 'custom_task_item.dart';

class HabitsBody extends StatelessWidget {
  const HabitsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppTexts.habitsToAccomplishToday,
          style: Styles.style16W600grey,
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 350.h,
          child: ListView.separated(
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
        const Spacer(),
        const CustomAddButton(
          text: AppTexts.addNewHabit,
        ),
        SizedBox(
          height: 104.h,
        )
      ],
    );
  }
}
