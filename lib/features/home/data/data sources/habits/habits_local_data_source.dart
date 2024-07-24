import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/constants/constants.dart';
import '../../models/habit model/habit_model.dart';

abstract class HabitsLocalDataSource {
  List<HabitModel>? getHabits();
  Future<void> addHabit(HabitModel habit);
  void deleteHabit(HabitModel habit);
  void updateHabit(HabitModel habit);
}

class HabitsLocalDataSourceImpl implements HabitsLocalDataSource {
  @override
  List<HabitModel>? getHabits() {
    var habitBox = Hive.box<HabitModel>(Constants.habitsBox);
    List<HabitModel> allHabits = habitBox.values.toList();

    return allHabits;
  }

  @override
  Future<void> addHabit(HabitModel habit) async {
    var habitBox = Hive.box<HabitModel>(Constants.habitsBox);
    await habitBox.add(habit);
  }

  @override
  void deleteHabit(HabitModel habit) {
    habit.delete();
  }

  @override
  void updateHabit(HabitModel habit) {
    throw UnimplementedError();
  }
}
