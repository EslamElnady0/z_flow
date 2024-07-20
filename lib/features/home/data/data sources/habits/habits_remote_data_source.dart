import '../../models/habit model/habit_model.dart';

abstract class HabitsRemoteDataSource {
  Future<List<HabitModel>> getHabits();
  Future<void> addHabit(HabitModel habit);
  Future<void> updateHabit(HabitModel habit);
  Future<void> deleteHabit(HabitModel habit);
}

class HabitsRemoteDataSourceImpl implements HabitsRemoteDataSource {
  @override
  Future<void> addHabit(HabitModel habit) {
    // TODO: implement addHabit
    throw UnimplementedError();
  }

  @override
  Future<void> deleteHabit(HabitModel habit) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<List<HabitModel>> getHabits() {
    // TODO: implement getHabits
    throw UnimplementedError();
  }

  @override
  Future<void> updateHabit(HabitModel habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }
}
