import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/widgets/no_empty_task_list.dart';
import 'package:z_flow/features/tasks%20cats/presentation/widgets/one_task_list_empty.dart';

import '../../../../core/constants/app_texts.dart';

class CategorizedTasksBody extends StatelessWidget {
  final String category;
  const CategorizedTasksBody({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        if (getIt.get<GetTaskCubit>().tasks.isEmpty) {
          return const Spacer();
        } else if (getIt.get<GetTaskCubit>().onGoingTasks.isNotEmpty &&
            getIt.get<GetTaskCubit>().doneTasks.isEmpty) {
          return OneTaskListEmpty(
            tasks: getIt.get<GetTaskCubit>().onGoingTasks,
            text: AppTexts.onGoingTasks,
            isDoneTasks: false,
          );
        } else if (getIt.get<GetTaskCubit>().onGoingTasks.isEmpty &&
            getIt.get<GetTaskCubit>().doneTasks.isNotEmpty) {
          return OneTaskListEmpty(
            tasks: getIt.get<GetTaskCubit>().doneTasks,
            text: AppTexts.tasksFinished,
            isDoneTasks: true,
          );
        } else {
          return NoEmptyTaskList(
            onGoingTasks: getIt.get<GetTaskCubit>().onGoingTasks,
            doneTasks: getIt.get<GetTaskCubit>().doneTasks,
          );
        }
      },
    );
  }
}
