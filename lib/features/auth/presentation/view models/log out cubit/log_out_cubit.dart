import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/auth/data/repos/auth_repo.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this.authRepo) : super(LogOutInitial());
  final AuthRepo authRepo;

  Future<void> logOut() async {
    emit(LogOutLoading());
    var result = await authRepo.logOut();
    result.fold((err) {
      emit(LogOutFailure(err.errMessage));
    }, (right) {
      emit(LogOutSuccess());
    });
  }
}
