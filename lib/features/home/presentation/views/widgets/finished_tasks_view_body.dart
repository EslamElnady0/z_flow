import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import 'all_finished_tasks_body.dart';
import 'custom_filter_row.dart';

class FinishedTasksViewBody extends StatelessWidget {
  const FinishedTasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: 16.h,
          ),
          const CustomFilterRow(),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, state) {
              return AllFinishedTasksBody(ctx: context);
            },
          )
        ],
      ),
    );
  }
}
