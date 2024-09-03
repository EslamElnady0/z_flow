import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/constants.dart';

abstract class TaskCatsLocalDataSource {
  List<String> getTaskCats();

  void addTaskCats(String category);
  void deleteTaskCategory(String category);

  void deleteAllTaskCats();
}

class TaskCatsLocalDataSourceImpl implements TaskCatsLocalDataSource {
  @override
  List<String> getTaskCats() {
    var taskCatsBox = Hive.box<String>(Constants.categoriesBox);
    List<String> allTaskCats = taskCatsBox.values.toList();
    return allTaskCats;
  }

  @override
  void addTaskCats(String category) {
    var taskCatsBox = Hive.box<String>(Constants.categoriesBox);
    List<String> allTaskCats = taskCatsBox.values.toList();
    if (!allTaskCats.contains(category)) {
      taskCatsBox.add(category);
    }
  }

  @override
  void deleteAllTaskCats() {
    var taskCatsBox = Hive.box<String>(Constants.categoriesBox);
    taskCatsBox.clear();
  }

  @override
  void deleteTaskCategory(String category) {
    var taskCatsBox = Hive.box<String>(Constants.categoriesBox);
    Map<dynamic, String> allTaskCats = taskCatsBox.toMap();

    // Find the key associated with the category value
    dynamic keyToRemove = allTaskCats.keys.firstWhere(
      (key) => allTaskCats[key] == category,
      orElse: () => null,
    );

    // If the key is found, remove the item from the box
    if (keyToRemove != null) {
      taskCatsBox.delete(keyToRemove);
    }
  }
}
