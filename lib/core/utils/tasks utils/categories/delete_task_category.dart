import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../features/tasks cats/presentation/view models/delete task category cubit/delete_task_category_cubit.dart';
import '../../../DI/service_locator.dart';
import '../../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_tasks_categories.dart';

Future<void> deleteTaskCategory(
    {required String category, required BuildContext context}) async {
  await getIt<DeleteTaskCategoryCubit>().deleteTaskCategory(
    category: category,
    isConnected: getIt<InternetCheckCubit>().isDeviceConnected,
    isAnonymous: getIt<FirebaseAuth>().currentUser!.isAnonymous,
  );
  if (context.mounted) {
    await getTasksCategories(context);
  }
}
