import 'package:hive_flutter/hive_flutter.dart';

import '../constants/constants.dart';

void incrementTasksId() async {
  var box = Hive.box(Constants.constantsBox);
  await box.put("tasksId", (box.get("tasksId") ?? 0) + 1);
}

void incrementHabitsId() async {
  var box = Hive.box(Constants.constantsBox);
  await box.put("habitsId", (box.get("habitsId") ?? 0) + 1);
}
