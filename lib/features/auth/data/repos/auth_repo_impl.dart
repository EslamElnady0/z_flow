import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/core/utils/clear_local_database_upon_sign_in.dart';
import 'package:z_flow/features/auth/data/models/user_model.dart';
import '../../../../core/errors/failure.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRepoImpl({
    required this.firebaseAuth,
    required this.firestore,
  });
  @override
  Future<Either<Failure, void>> addUserToFireStore(
      {required UserModel user}) async {
    try {
      await firestore.collection("users").doc(user.uid).set(user.toJson());
      return right(null);
    } catch (exception) {
      if (exception is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: exception));
      } else {
        log(exception.toString());
        return left(
            ServerFailure(errMessage: "'Server Error, please try again'"));
      }
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    if (firebaseAuth.currentUser == null) {
      return null;
    }
    return firebaseAuth.currentUser!.uid;
  }

  @override
  Future<bool> isUserLoggedIn() async {
    if (firebaseAuth.currentUser == null ||
        firebaseAuth.currentUser!.isAnonymous) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      if (firebaseAuth.currentUser != null) {
        if (await GoogleSignIn().isSignedIn()) {
          await GoogleSignIn().signOut();
        }
        await firebaseAuth.signOut();
        return right(null);
      }
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else if (e is PlatformException) {
        return left(NetworkFailure.fromPlatformException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signInAnonymous() async {
    try {
      await firebaseAuth.signInAnonymously();
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "'Server Error, please try again'"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await clearLocalDatabaseUponSignIn();
      LocalNotifications.cancelAllNotifications();
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        log(e.toString());
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else if (e is PlatformException) {
        return left(NetworkFailure.fromPlatformException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "'Server Error, please try again'"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        return left(ServerFailure(errMessage: "Sign-In cancelled by user"));
      }
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credentials);
      await addUserToFireStore(
          user: UserModel(
              email: firebaseAuth.currentUser!.email!,
              firstName: gUser.displayName!.split(" ")[0],
              lastName: gUser.displayName!.split(" ")[1],
              uid: firebaseAuth.currentUser!.uid));
      await firebaseAuth.currentUser!.updateDisplayName(gUser.displayName!);
      await clearLocalDatabaseUponSignIn();
      LocalNotifications.cancelAllNotifications();
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else if (e is PlatformException) {
        return left(NetworkFailure.fromPlatformException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel user = UserModel(
          email: email,
          firstName: firstName,
          lastName: lastName,
          uid: firebaseAuth.currentUser!.uid);
      await firebaseAuth.currentUser!.updateDisplayName("$firstName $lastName");

      await addUserToFireStore(user: user);
      await clearLocalDatabaseUponSignIn();
      LocalNotifications.cancelAllNotifications();
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else if (e is PlatformException) {
        return left(NetworkFailure.fromPlatformException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }
}
