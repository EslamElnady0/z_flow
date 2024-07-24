import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/repos/tasks%20repo/tasks_repo.dart';

import '../../../../data/models/task model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.tasksRepo) : super(AddTaskInitial());
  final TasksRepo tasksRepo;

  Future<void> addTask(
      {required TaskModel task,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    emit(AddTaskLoading());
    var result = await tasksRepo.addTask(
        task: task,
        isConnected: isConnected,
        isAnonymous: isAnonymous,
        uid: uid);

    result.fold((failure) {
      emit(AddTaskFailure(errMesage: failure.errMessage));
    }, (r) {
      emit(AddTaskSuccess());
    });
  }
}
