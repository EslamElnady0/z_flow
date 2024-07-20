import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/habit model/habit_model.dart';
import 'habits_repo.dart';

class HabitsRepoImpl implements HabitsRepo {
  @override
  Either<Failure, Future<void>> addHabit(HabitModel habit) {
    // TODO: implement addHabit
    throw UnimplementedError();
  }

  @override
  Either<Failure, Future<void>> deleteHabit(HabitModel habit) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Either<Failure, Future<List<HabitModel>>> getHabits() {
    // TODO: implement getHabits
    throw UnimplementedError();
  }

  @override
  Either<Failure, Future<void>> updateHabit(HabitModel habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }
}
