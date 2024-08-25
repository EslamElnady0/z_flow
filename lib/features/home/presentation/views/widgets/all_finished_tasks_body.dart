import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import 'custom_task_item.dart';

class AllFinishedTasksBody extends StatelessWidget {
  final BuildContext ctx;
  const AllFinishedTasksBody({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          GlobalKey actionKey = GlobalKey();
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 10.w),
              child: CustomTaskItem(
                task: context.read<GetTaskCubit>().doneTasks[index],
                actionKey: actionKey,
              ));
        },
        itemCount: context.read<GetTaskCubit>().doneTasks.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16.h,
          );
        },
      ),
    );
  }
}
