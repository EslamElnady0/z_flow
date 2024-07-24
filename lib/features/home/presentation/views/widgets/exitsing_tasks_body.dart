import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/view%20models/get%20task%20cubit/get_task_cubit.dart';

import '../widgets/custom_task_item.dart';

class ExistingTasksBody extends StatelessWidget {
  const ExistingTasksBody({
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
          height: 450.h,
          child: ListView.separated(
            itemBuilder: (context, index) {
              GlobalKey actionKey = GlobalKey();
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 10.w),
                  child: CustomTaskItem(
                    task: getIt.get<GetTaskCubit>().tasks[index],
                    actionKey: actionKey,
                  ));
            },
            itemCount: getIt.get<GetTaskCubit>().tasks.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
          ),
        ),
      ],
    );
  }
}
