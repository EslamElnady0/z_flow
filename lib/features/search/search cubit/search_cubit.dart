import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/data%20sources/habits/habits_local_data_source.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_local_data_source.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TasksLocalDataSource tasksLocalDataSource;
  final HabitsLocalDataSource habitsLocalDataSource;
  SearchCubit(this.tasksLocalDataSource, this.habitsLocalDataSource)
      : super(SearchInitial());

  List<TaskModel> tasksSearchResults = [];
  List<HabitModel> habitsSearchResults = [];

  searchForTask({required String query}) {
    List<TaskModel> allTasks = tasksLocalDataSource.getTasks()!;
    tasksSearchResults = allTasks
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchSuccess());
  }

  searchForHabit({required String query}) {
    List<HabitModel> allHabits = habitsLocalDataSource.getHabits()!;
    habitsSearchResults = allHabits
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchSuccess());
  }
}
