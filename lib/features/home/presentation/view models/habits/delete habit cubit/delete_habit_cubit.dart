import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_habit_state.dart';

class DeleteHabitCubit extends Cubit<DeleteHabitState> {
  DeleteHabitCubit() : super(DeleteHabitInitial());
}
