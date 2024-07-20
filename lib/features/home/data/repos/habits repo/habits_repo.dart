import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/habit model/habit_model.dart';

abstract class HabitsRepo {
  Either<Failure, Future<void>> addHabit(HabitModel habit);
  Either<Failure, Future<void>> updateHabit(HabitModel habit);
  Either<Failure, Future<void>> deleteHabit(HabitModel habit);
  Either<Failure, Future<List<HabitModel>>> getHabits();
}
