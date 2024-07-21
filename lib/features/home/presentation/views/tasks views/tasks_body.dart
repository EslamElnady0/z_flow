import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../../../../../core/routes/app_router.dart';
import '../widgets/custom_add_button.dart';
import '../widgets/custom_task_item.dart';

class TasksBody extends StatelessWidget {
  const TasksBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppTexts.onGoingTasks,
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
                  child: CustomTaskItem(
                    actionKey: actionKey,
                  ));
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
            text: AppTexts.addNewTask,
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.home);
            },
          ),
        ),
        SizedBox(
          height: 104.h,
        )
      ],
    );
  }
}
