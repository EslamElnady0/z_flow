import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromFirebaseException(
      {required FirebaseException exception}) {
    return ServerFailure(
      errMessage: exception.message ?? 'Server Error, please try again',
    );
  }
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errMessage});

  factory CacheFailure.fromHiveError({required HiveError error}) {
    return CacheFailure(
      errMessage: error.message,
    );
  }
}
