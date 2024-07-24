import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_habits_state.dart';

class AddHabitsCubit extends Cubit<AddHabitsState> {
  AddHabitsCubit() : super(AddHabitsInitial());
}
