import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/auth/data/repos/auth_repo.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.authRepo) : super(LogInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    emit(LogInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold((err) {
      emit(LogInFailure(err.errMessage));
    }, (right) {
      emit(LogInSuccess());
    });
  }

  Future<void> signInAnonymous() async {
    emit(LogInLoading());
    var result = await authRepo.signInAnonymous();
    result.fold((err) {
      emit(LogInFailure(err.errMessage));
    }, (right) {
      emit(LogInSuccess());
    });
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LogInLoading());
    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold((err) {
      emit(LogInFailure(err.errMessage));
    }, (right) {
      emit(LogInSuccess());
    });
  }
}
