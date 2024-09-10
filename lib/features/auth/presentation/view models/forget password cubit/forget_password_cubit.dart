import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(ForgetPasswordLoading());
    var result = await authRepo.sendPasswordResetEmail(email: email);
    result.fold((err) {
      emit(ForgetPasswordFailure(err.errMessage));
    }, (right) {
      emit(ForgetPasswordSuccess());
    });
  }
}
