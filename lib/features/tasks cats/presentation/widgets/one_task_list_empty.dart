import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';

import '../../../../core/styles/styles.dart';
import '../../../home/data/models/task model/task_model.dart';
import '../../../home/presentation/views/widgets/custom_task_item.dart';

class OneTaskListEmpty extends StatelessWidget {
  final List<TaskModel> tasks;
  final String text;
  final bool isDoneTasks;
  const OneTaskListEmpty(
      {super.key,
      required this.tasks,
      required this.text,
      required this.isDoneTasks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(text, style: Styles.style16W600grey),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              GlobalKey actionKey = GlobalKey();
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 10.w),
                  child: CustomTaskItem(
                    task: isDoneTasks
                        ? getIt.get<GetTaskCubit>().doneTasks[index]
                        : getIt.get<GetTaskCubit>().onGoingTasks[index],
                    actionKey: actionKey,
                  ));
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 16.h,
            ),
            itemCount: tasks.length,
            padding: EdgeInsets.zero,
          )),
        ],
      ),
    );
  }
}
