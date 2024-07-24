import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/task model/task_model.dart';
import '../../../data/repos/tasks repo/tasks_repo.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.tasksRepo) : super(UpdateTaskInitial());

  final TasksRepo tasksRepo;

  Future<void> updateTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    emit(UpdateTaskLoading());
    var result = await tasksRepo.updateTask(
        task: task,
        isConnected: isConnected,
        isAnonymous: isAnonymous,
        uid: uid);

    result.fold((failure) {
      emit(UpdateTaskFailure(errMessage: failure.errMessage));
    }, (r) {
      emit(UpdateTaskSuccess());
    });
  }
}
