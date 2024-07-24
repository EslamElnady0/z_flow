import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/task model/task_model.dart';
import '../../../../data/repos/tasks repo/tasks_repo.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.tasksRepo) : super(DeleteTaskInitial());

  final TasksRepo tasksRepo;

  Future<void> deleteTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    emit(DeleteTaskLoading());
    var result = await tasksRepo.deleteTask(
        task: task,
        isConnected: isConnected,
        isAnonymous: isAnonymous,
        uid: uid);

    result.fold((failure) {
      emit(DeleteTaskFailure(failure.errMessage));
    }, (r) {
      emit(DeleteTaskSuccess());
    });
  }
}
