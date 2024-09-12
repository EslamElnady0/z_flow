import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_flow/core/DI/service_locator.dart';

import '../../../../features/tasks cats/presentation/view models/get tasks categories cubit/get_tasks_categories_cubit.dart';
import '../../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> getTasksCategories(BuildContext context) async {
  await getIt.get<GetTasksCategoriesCubit>().getTasksCategories(
        isConnected: getIt<InternetCheckCubit>().isDeviceConnected,
        context: context,
        isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      );
}
