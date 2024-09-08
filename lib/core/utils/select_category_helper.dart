import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/ui logic/ui cubits/select task categories cubit/select_task_categories_cubit.dart';
import '../../features/tasks cats/presentation/view models/get tasks categories cubit/get_tasks_categories_cubit.dart';
import '../DI/service_locator.dart';

selecCategoryHelper(bool value, BuildContext context, int index) {
  if (value == true) {
    context
        .read<SelectTaskCategoriesCubit>()
        .taskCategories
        .add(getIt.get<GetTasksCategoriesCubit>().cats[index]);
  } else {
    context
        .read<SelectTaskCategoriesCubit>()
        .taskCategories
        .remove(getIt.get<GetTasksCategoriesCubit>().cats[index]);
  }

  context.read<SelectTaskCategoriesCubit>().selectCategory(
      isSelected: value,
      category: getIt.get<GetTasksCategoriesCubit>().cats[index]);
}
