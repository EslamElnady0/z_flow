import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/settings/data/repo/account_repo.dart';

import '../../../auth/data/models/user_model.dart';

part 'accout_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit({required this.accountRepo}) : super(AccountInitial());
  final AccountRepo accountRepo;
  String photoUrl = "";
  String? filePath;
  UserModel? userModel;
  Future<void> updateUserData(
      {required UserModel user,
      required bool isAnonymous,
      required bool isConnected}) async {
    emit(AccountLoading());
    final result = await accountRepo.updateUserData(
        user: user, isAnonymous: isAnonymous, isConnected: isConnected);
    result.fold(
      (failure) => emit(AccountFailure(errMessage: failure.errMessage)),
      (r) => emit(AccountSuccess()),
    );
  }

  Future<void> uploadUserPhotoToFirebaseStorage({
    required File file,
    required bool isAnonymous,
    required bool isConnected,
    required String path,
  }) async {
    emit(AccountLoading());
    final result = await accountRepo.uploadUserPhotoToFirebaseStorage(
        file: file,
        isAnonymous: isAnonymous,
        isConnected: isConnected,
        path: path);
    result
        .fold((failure) => emit(AccountFailure(errMessage: failure.errMessage)),
            (photoUrlOnFireStorage) {
      photoUrl = photoUrlOnFireStorage;
      emit(AccountSuccess(imageUrl: photoUrlOnFireStorage));
    });
  }

  Future<UserModel?> getUserData(
      {required bool isAnonymous, required bool isConnected}) async {
    emit(AccountLoading());
    final result = await accountRepo.getUserData(
        isAnonymous: isAnonymous, isConnected: isConnected);
    result
        .fold((failure) => emit(AccountFailure(errMessage: failure.errMessage)),
            (user) {
      userModel = user;
      photoUrl = user?.photoUrl ?? "";
      emit(AccountSuccess(imageUrl: photoUrl));
    });
    log("photoUrl: $photoUrl , userName: ${userModel?.firstName}");
    return userModel;
  }
}
