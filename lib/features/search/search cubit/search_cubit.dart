import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/data%20sources/tasks/tasks_local_data_source.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TasksLocalDataSource tasksLocalDataSource;
  SearchCubit(this.tasksLocalDataSource) : super(SearchInitial());

  List<TaskModel> tasksSearchResults = [];

  searchForTask({required String query}) {
    List<TaskModel> allTasks = tasksLocalDataSource.getTasks()!;
    tasksSearchResults = allTasks
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchSuccess());
  }
}
