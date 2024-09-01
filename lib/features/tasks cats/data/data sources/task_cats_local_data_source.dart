import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/constants.dart';

abstract class TaskCatsLocalDataSource {
  List<String> getTaskCats();

  void addTaskCats(String category);
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
}
