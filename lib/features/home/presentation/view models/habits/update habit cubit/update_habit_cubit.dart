import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_habit_state.dart';

class UpdateHabitCubit extends Cubit<UpdateHabitState> {
  UpdateHabitCubit() : super(UpdateHabitInitial());
}
