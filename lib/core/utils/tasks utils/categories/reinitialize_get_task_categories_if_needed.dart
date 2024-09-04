import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';

import '../../../../features/tasks cats/data/repos/task_cats_repo_impl.dart';
import '../../../DI/service_locator.dart';

void reinitializeGetCategoriesCubitIfNeeded() {
  if (!getIt.isRegistered<GetTasksCategoriesCubit>()) {
    getIt.registerSingleton<GetTasksCategoriesCubit>(
        GetTasksCategoriesCubit(taskCatsRepo: getIt.get<TaskCatsRepoImpl>()));
  }
}
