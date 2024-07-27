import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';

import '../../../../home/data/models/task model/task_model.dart';

part 'favourite_tasks_state.dart';

class FavouriteTasksCubit extends Cubit<FavouriteTasksState> {
  FavouriteTasksCubit(this.getTaskCubit) : super(FavouriteTasksInitial());

  GetTaskCubit getTaskCubit;

  List<TaskModel> favTasks = [];
  void getFavTasks() {
    List<TaskModel> allTasks = getTaskCubit.tasks;
    for (var i = 0; i < allTasks.length; i++) {
      if (allTasks[i].isFavourited) {
        if (!favTasks.contains(allTasks[i])) {
          favTasks.add(allTasks[i]);
        }
      }
    }
    emit(FavouriteTasksSuccess());
    print(favTasks.length);
  }
}
