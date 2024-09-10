import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/auth_repo.dart';

part 'log_in_ano_state.dart';

class LogInAnoCubit extends Cubit<LogInAnoState> {
  LogInAnoCubit(this.authRepo) : super(LogInAnoInitial());
  final AuthRepo authRepo;

  Future<void> signInAnonymous() async {
    emit(LogInAnoLoading());
    var result = await authRepo.signInAnonymous();
    result.fold((err) {
      emit(LogInAnoFailure(err.errMessage));
    }, (right) {
      emit(LogInAnoSuccess());
    });
  }
}
