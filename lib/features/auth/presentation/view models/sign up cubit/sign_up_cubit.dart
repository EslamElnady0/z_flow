import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUpWithEmailAndPassword(
        email: email, password: password);
    result.fold((err) {
      emit(SignUpFailure(err.errMessage));
    }, (right) {
      emit(SignUpSuccess());
    });
  }
}
