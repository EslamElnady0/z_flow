import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
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
  factory NetworkFailure.fromPlatformException(
      {required PlatformException exception}) {
    log(exception.toString());
    if (exception.code == 'network_error') {
      return NetworkFailure(
          errMessage: 'Network Error, please check your internet connection');
    } else {
      return NetworkFailure(
          errMessage: exception.message ??
              'There was an error, please try again later');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.errMessage});

  factory CacheFailure.fromHiveError({required HiveError error}) {
    return CacheFailure(
      errMessage: error.message,
    );
  }
}
