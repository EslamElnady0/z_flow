import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/view%20models/get%20task%20cubit/get_task_cubit.dart';

import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/tasks utils/get_tasks.dart';
import '../widgets/custom_add_button.dart';
import '../widgets/custom_task_item.dart';

class TasksBody extends StatefulWidget {
  const TasksBody({
    super.key,
  });

  @override
  State<TasksBody> createState() => _TasksBodyState();
}

class _TasksBodyState extends State<TasksBody> {
  @override
  void initState() {
    getTasks();
    super.initState();
  }

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
          child: BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, state) {
              if (getIt.get<GetTaskCubit>().tasks.isEmpty) {
                return Center(
                  child: Text("empty"),
                );
              } else {
                return ListView.separated(
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
                );
              }
            },
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w),
          child: CustomAddButton(
            text: AppTexts.addNewTask,
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.addTask);
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
