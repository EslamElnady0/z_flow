import 'package:dartz/dartz.dart';
import 'package:z_flow/core/errors/failure.dart';
import 'package:z_flow/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> addUserToFireStore({required UserModel user});
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signInAnonymous();
  Future<Either<Failure, void>> logOut();
  Future<bool> isUserLoggedIn();
  Future<String?> getCurrentUserId();
}
