import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:z_flow/core/errors/failure.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';
import 'package:z_flow/features/reminder/data/data%20sources/events_local_data_source.dart';
import 'package:z_flow/features/reminder/data/data%20sources/events_remote_data_source.dart';

import 'package:z_flow/features/reminder/data/model/event_model.dart';

import '../../../../core/services/local_notifications.dart';
import 'events_repo.dart';

class EventsRepoImpl implements EventsRepo {
  final EventsLocalDataSource eventsLocalDataSource;
  final EventsRemoteDataSource eventsRemoteDataSource;

  EventsRepoImpl(
      {required this.eventsLocalDataSource,
      required this.eventsRemoteDataSource});
  @override
  Future<Either<Failure, void>> addEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await eventsRemoteDataSource.addEvent(event);
      }
      eventsLocalDataSource.addEvent(event);
      return right(null);
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
  Future<Either<Failure, void>> deleteEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await eventsRemoteDataSource.deleteEvent(event);
      }
      eventsLocalDataSource.deleteEvent(event);
      return right(null);
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
  Future<Either<Failure, List<EventModel>>> getEvents(
      {required bool isConnected, required bool isAnonymous}) async {
    try {
      List<EventModel> events = eventsLocalDataSource.getEvents();
      if (events.isNotEmpty) {
        return right(events);
      } else {
        if (isConnected && !isAnonymous) {
          events = await eventsRemoteDataSource.getEvents();
          await LocalNotifications.requestNotificationPermission();
          for (var event in events) {
            eventsLocalDataSource.addEvent(event);
            scheduleEventNotification(event);
          }
          return right(events);
        }
        return right(events);
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
  Future<Either<Failure, void>> updateEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await eventsRemoteDataSource.updateEvent(event);
      }
      eventsLocalDataSource.updateEvent(event);
      return right(null);
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
