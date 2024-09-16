import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());
  Duration duration = const Duration();
  int workingSeconds = 60 * 50;
  int workingCounter = 60 * 50;
  int breakSeconds = 60 * 10;
  int breakCounter = 60 * 10;
  bool isPaused = false;

  updateTimer() {
    emit(TimerChange());
  }
}
