import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_habit_state.dart';

class GetHabitCubit extends Cubit<GetHabitState> {
  GetHabitCubit() : super(GetHabitInitial());
}
