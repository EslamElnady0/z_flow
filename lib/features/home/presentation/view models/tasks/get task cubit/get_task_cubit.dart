import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../../../data/repos/tasks repo/tasks_repo.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit(this.tasksRepo) : super(GetTaskInitial());

  final TasksRepo tasksRepo;
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();
  Duration? duration;

  List<TaskModel> specificDayTasksList = [];
  List<TaskModel> tasks = [];
  Map<String, List<TaskModel>> groupedTasks = {};
  List<TaskModel> onGoingTasks = [];
  List<TaskModel> doneTasks = [];
  List<TaskModel> recentDoneTasks = [];
  List<TaskModel> recentOngoingTasks = [];
  List<TaskModel> categorizedTasks = [];
  List<TaskModel> categorizedOngoingTasks = [];
  List<TaskModel> categorizedDoneTasks = [];

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
      _groupedTasksByCreationData();
      for (var i = 0; i < tasks.length; i++) {
        if (!tasks[i].isDone) {
          if (!onGoingTasks.contains(tasks[i])) {
            onGoingTasks.add(tasks[i]);
          }
        } else {
          if (!doneTasks.contains(tasks[i])) {
            doneTasks.add(tasks[i]);
          }
        }
      }
      emit(GetTaskSuccess());
    });
  }

  Map<String, List<TaskModel>> _groupedTasksByCreationData() {
    groupedTasks = {};

    for (var task in tasks) {
      String dateKey = task.createdAt;

      if (groupedTasks.containsKey(dateKey)) {
        groupedTasks[dateKey]!.add(task);
      } else {
        groupedTasks[dateKey] = [task];
      }
    }

    return groupedTasks;
  }

  void getRecentTasksFilter() {
    if (duration == null) {
      recentDoneTasks = doneTasks;
      recentOngoingTasks = onGoingTasks;
      emit(GetTaskSuccess());
    } else {
      recentDoneTasks = [];
      recentOngoingTasks = [];
      DateTime now = DateTime.now();
      DateTime wantedDuration = now.subtract(duration!);
      for (var task in doneTasks) {
        if (task.doneAt != "" && task.isDone) {
          DateTime taskDoneDate = DateTime.parse(task.doneAt);

          if (taskDoneDate.isAfter(wantedDuration)) {
            recentDoneTasks.add(task);
          }
        }
      }
      for (var task in onGoingTasks) {
        if (!task.isDone) {
          DateTime? taskCreationDate = parseDateString(task.createdAt);

          if (taskCreationDate!.isAfter(wantedDuration)) {
            recentOngoingTasks.add(task);
          }
        }
      }
      emit(GetTaskSuccess());
    }
  }

  List<TaskModel> getTasksByDate(DateTime date) {
    String keyDate = DateFormat.yMMMd().format(date);
    return groupedTasks[keyDate] ?? [];
  }

  void getCategorizedTasks(String category) {
    categorizedTasks =
        tasks.where((task) => task.category.contains(category)).toList();
    categorizedOngoingTasks =
        categorizedTasks.where((task) => !task.isDone).toList();
    categorizedDoneTasks =
        categorizedTasks.where((task) => task.isDone).toList();
    emit(GetTaskSuccess());
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
    focusedDay = focusDay;
    specificDayTasksList = [];
    getSpecificDayTasks(focusDay);
    emit(DaySelectedState());
  }
}
