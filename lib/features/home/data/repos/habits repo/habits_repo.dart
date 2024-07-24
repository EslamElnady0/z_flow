import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/habit model/habit_model.dart';

abstract class HabitsRepo {
  Future<Either<Failure, Future<void>>> addHabit(
      {required HabitModel habit,
      required bool isConnected,
      required bool isAnonymous,
      required String uid});
  Future<Either<Failure, Future<void>>> updateHabit(
      {required HabitModel habit,
      required bool isConnected,
      required bool isAnonymous,
      required String uid});
  Future<Either<Failure, Future<void>>> deleteHabit(
      {required HabitModel habit,
      required bool isConnected,
      required bool isAnonymous,
      required String uid});
  Future<Either<Failure, List<HabitModel>>> getHabits(
      {required bool isConnected,
      required bool isAnonymous,
      required String uid});
}
