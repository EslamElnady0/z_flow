import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../widgets/custom_add_button.dart';
import '../widgets/custom_task_item.dart';

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
            itemBuilder: (context, index) {
              GlobalKey actionKey = GlobalKey();
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 10.w),
                  child: SizedBox()
                  // CustomTaskItem(
                  //   actionKey: actionKey,
                  // )
                  );
            },
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w),
          child: CustomAddButton(
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.addHabit);
            },
            text: AppTexts.addNewHabit,
          ),
        ),
        SizedBox(
          height: 104.h,
        )
      ],
    );
  }
}
