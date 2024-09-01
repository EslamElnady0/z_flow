import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class TaskCatsRepo {
  Future<Either<Failure, List<String>>> getTaskCats(
      {required bool isConnected, required bool isAnonymous});

  Future<Either<Failure, void>> addTaskCats(
      {required String category,
      required bool isConnected,
      required bool isAnonymous});
}
