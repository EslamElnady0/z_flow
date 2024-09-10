import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/local_notifications.dart';
import '../../data sources/habits/habits_local_data_source.dart';
import '../../data sources/habits/habits_remote_data_source.dart';
import '../../models/habit model/habit_model.dart';
import 'habits_repo.dart';

class HabitsRepoImpl implements HabitsRepo {
  final HabitsLocalDataSourceImpl habitsLocalDataSource;
  final HabitsRemoteDataSourceImpl habitsRemoteDataSource;
  HabitsRepoImpl(this.habitsLocalDataSource, this.habitsRemoteDataSource);

  @override
  Future<Either<Failure, Future<void>>> addHabit(
      {required HabitModel habit,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      if (isConnected && !isAnonymous) {
        await habitsRemoteDataSource.addHabit(habit: habit, uid: uid);
      }
      await habitsLocalDataSource.addHabit(habit);

      return right(Future.value(null));
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, Future<void>>> deleteHabit(
      {required HabitModel habit,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      if (isConnected && !isAnonymous) {
        await habitsRemoteDataSource.deleteHabit(habit: habit, uid: uid);
      }
      habitsLocalDataSource.deleteHabit(habit);

      return right(Future.value(null));
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, List<HabitModel>>> getHabits(
      {required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      List<HabitModel>? habits = habitsLocalDataSource.getHabits();

      if (habits!.isNotEmpty) {
        return right(habits);
      } else {
        if (isConnected && !isAnonymous) {
          habits = await habitsRemoteDataSource.getHabits(uid: uid);
          await LocalNotifications.requestNotificationPermission();
          for (var habit in habits) {
            await habitsLocalDataSource.addHabit(habit);
            if (habit.isIterable) {
              setDailyHabitsNotification(habit);
            }
          }
          return right(habits);
        }
        return right(habits);
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, Future<void>>> updateHabit(
      {required HabitModel habit,
      required bool isConnected,
      required bool isAnonymous,
      required String uid}) async {
    try {
      if (isConnected && !isAnonymous) {
        await habitsRemoteDataSource.updateHabit(habit: habit, uid: uid);
      }
      habitsLocalDataSource.updateHabit(habit);

      return right(Future.value(null));
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }
}
