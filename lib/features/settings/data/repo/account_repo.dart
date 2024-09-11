import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:z_flow/core/DI/service_locator.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/user_model.dart';

class AccountRepo {
  Future<Either<Failure, void>> updateUserData(
      {required UserModel user,
      required bool isAnonymous,
      required bool isConnected}) async {
    try {
      if (!isAnonymous && isConnected) {
        await getIt
            .get<FirebaseFirestore>()
            .collection("users")
            .doc(user.uid)
            .update(user.toJson());
      }
      return right(null);
    } catch (exception) {
      if (exception is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: exception));
      } else {
        log(exception.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  Future<Either<Failure, UserModel?>> getUserData(
      {required bool isAnonymous, required bool isConnected}) async {
    try {
      if (!isAnonymous && isConnected) {
        DocumentSnapshot<Map<String, dynamic>> snapshot = await getIt
            .get<FirebaseFirestore>()
            .collection("users")
            .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
            .get();
        UserModel user = UserModel.fromJson(snapshot.data()!);
        return right(user);
      }

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

  Future<Either<Failure, String>> uploadUserPhotoToFirebaseStorage(
      {required String path,
      required File file,
      required bool isAnonymous,
      required bool isConnected}) async {
    try {
      UploadTask? uploadTask;

      uploadTask = getIt.get<FirebaseStorage>().ref().child(path).putFile(file);

      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return right(imageUrl);
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
