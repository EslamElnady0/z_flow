import 'package:z_flow/features/reminder/data/data%20sources/events_local_data_source.dart';

import '../../features/goals/data/data sources/goals_local_data_source.dart';
import '../../features/home/data/data sources/habits/habits_local_data_source.dart';
import '../../features/home/data/data sources/tasks/tasks_local_data_source.dart';
import '../../features/tasks cats/data/data sources/task_cats_local_data_source.dart';
import '../constants/constants.dart';
import 'habits utils/get_habits.dart';
import 'tasks utils/get_tasks.dart';

Future<void> clearLocalDatabaseUponSignIn() async {
  await TasksLocalDataSourceImpl().deleteAllTasks(Constants.tasksBox);
  await HabitsLocalDataSourceImpl().deleteAllHabits(Constants.habitsBox);
  TaskCatsLocalDataSourceImpl().deleteAllTaskCats();
  GoalsLocalDataSourceImpl().deleteAllGoals();
  EventsLocalDataSourceImpl().deleteAllEvents();
  clearAllTasksLists();
  clearAllHabitsLists();
}
