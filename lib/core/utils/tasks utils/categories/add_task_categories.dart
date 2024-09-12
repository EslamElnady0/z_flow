import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/add%20tasks%20category%20cubit/add_tasks_category_cubit.dart';

import '../../../DI/service_locator.dart';
import '../../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_tasks_categories.dart';

Future<void> addTaskCategory(
    {required String category, required BuildContext context}) async {
  await getIt<AddTasksCategoryCubit>().addTaskCategory(
    category: category,
    isConnected: getIt<InternetCheckCubit>().isDeviceConnected,
    isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
  );

  if (context.mounted) {
    await getTasksCategories(context);
  }
}
