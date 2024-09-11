import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/utils/tasks%20utils/get_duration_text.dart';

import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import 'custom_task_item.dart';

class FinishedTasksOnDurationListView extends StatelessWidget {
  final BuildContext ctx;
  const FinishedTasksOnDurationListView({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getDurationText(
                duration: getIt.get<GetTaskCubit>().duration, context: context),
            style: Styles.style18w600,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                GlobalKey actionKey = GlobalKey();
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    child: CustomTaskItem(
                      task: ctx.read<GetTaskCubit>().recentDoneTasks[index],
                      actionKey: actionKey,
                    ));
              },
              itemCount: ctx.read<GetTaskCubit>().recentDoneTasks.length,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.h,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
