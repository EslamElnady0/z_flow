import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../../data/repos/tasks repo/tasks_repo.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit(this.tasksRepo) : super(GetTaskInitial());

  final TasksRepo tasksRepo;
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();

  List<TaskModel> specificDayTasksList = [];
  List<TaskModel> tasks = [];

  Future<void> getTasks(
      {required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    emit(GetTaskLoading());
    var result = await tasksRepo.getTasks(
        isConnected: isConnected, isAnonymous: isAnonymous, uid: uid);

    result.fold((failure) {
      emit(GetTaskFailure(failure.errMessage));
    }, (tasksList) {
      tasks = tasksList;
      emit(GetTaskSuccess());
    });
  }

  void getSpecificDayTasks(
    DateTime day,
  ) {
    for (var task in tasks) {
      if (task.createdAt == DateFormat.yMMMd().format(day)) {
        if (!specificDayTasksList.contains(task)) {
          specificDayTasksList.add(task);
        }
      }
    }

    emit(GetTaskSuccess());
  }

  onDaySelected(DateTime day, DateTime focusDay) {
    today = day;
    // focusedDay = focusDay;
    specificDayTasksList = [];
    getSpecificDayTasks(focusDay);
    emit(DaySelectedState());
  }
}
