import 'package:hive_flutter/hive_flutter.dart';

import '../constants/constants.dart';

void incrementTasksId() async {
  var box = Hive.box(Constants.constantsBox);
  await box.put("id", (box.get("id") ?? 0) + 1);
}
