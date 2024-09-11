import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/settings/data/repo/account_repo.dart';

import '../../../auth/data/models/user_model.dart';

part 'accout_state.dart';

class AccoutCubit extends Cubit<AccoutState> {
  AccoutCubit({required this.accountRepo}) : super(AccoutInitial());
  final AccountRepo accountRepo;
  String photoUrl = "";
  Future<void> updateUserData(
      {required UserModel user,
      required bool isAnonymous,
      required bool isConnected}) async {
    emit(AccoutLoading());
    final result = await accountRepo.updateUserData(
        user: user, isAnonymous: isAnonymous, isConnected: isConnected);
    result.fold(
      (failure) => emit(AccoutFailure(errMessage: failure.errMessage)),
      (r) => emit(AccoutSuccess()),
    );
  }

  Future<void> uploadUserPhotoToFirebaseStorage({
    required File file,
    required bool isAnonymous,
    required bool isConnected,
    required String path,
  }) async {
    emit(AccoutLoading());
    final result = await accountRepo.uploadUserPhotoToFirebaseStorage(
        file: file,
        isAnonymous: isAnonymous,
        isConnected: isConnected,
        path: path);
    result
        .fold((failure) => emit(AccoutFailure(errMessage: failure.errMessage)),
            (photoUrlOnFireStorage) {
      photoUrl = photoUrlOnFireStorage;
      emit(AccoutSuccess(imageUrl: photoUrlOnFireStorage));
    });
  }
}
