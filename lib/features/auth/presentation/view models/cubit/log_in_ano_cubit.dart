import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_ano_state.dart';

class LogInAnoCubit extends Cubit<LogInAnoState> {
  LogInAnoCubit() : super(LogInAnoInitial());
}
