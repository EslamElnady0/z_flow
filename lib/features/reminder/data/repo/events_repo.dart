import 'package:dartz/dartz.dart';
import 'package:z_flow/core/errors/failure.dart';

import '../model/event_model.dart';

abstract class EventsRepo {
  Future<Either<Failure, List<EventModel>>> getEvents(
      {required bool isConnected, required bool isAnonymous});

  Future<Either<Failure, void>> addEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous});

  Future<Either<Failure, void>> deleteEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous});

  Future<Either<Failure, void>> updateEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous});
}
