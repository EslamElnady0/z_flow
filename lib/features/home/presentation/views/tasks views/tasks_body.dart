import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/utils/habits%20utils/get_habits.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/utils/tasks utils/get_tasks.dart';
import '../widgets/custom_light_colors_gradient_button.dart';
import '../widgets/exitsing_tasks_body.dart';
import '../widgets/no_tasks_body.dart';

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
    getHabits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BlocBuilder<GetTaskCubit, GetTaskState>(
          builder: (context, state) {
            if (getIt.get<GetTaskCubit>().onGoingTasks.isEmpty) {
              return const NoTasksBody();
            } else {
              return ExistingTasksBody(ctx: context);
            }
          },
        ),
        BlocBuilder<GetTaskCubit, GetTaskState>(
          builder: (context, state) {
            if (context.read<GetTaskCubit>().doneTasks.isEmpty) {
              return const SizedBox.shrink();
            } else {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.tasksFinished);
                },
                child: Text(
                  AppTexts.tasksFinished,
                  style: Styles.style16W400white.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: ColorManager.lightGrey),
                ),
              );
            }
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w),
          child: CustomLightColorsGradientButton(
            icon: Assets.addIcon,
            text: AppTexts.addNewTask,
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.addTask);
            },
          ),
        ),
        SizedBox(
          height: 100.h,
        )
      ],
    );
  }
}
