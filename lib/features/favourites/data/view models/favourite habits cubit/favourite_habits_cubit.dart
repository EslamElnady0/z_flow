import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/get%20habits%20cubit/get_habit_cubit.dart';

part 'favourite_habits_state.dart';

class FavouriteHabitsCubit extends Cubit<FavouriteHabitsState> {
  FavouriteHabitsCubit(this.getHabitCubit) : super(FavouriteHabitsInitial());

  GetHabitCubit getHabitCubit;

  List<HabitModel> favHabits = [];
  void getFavTasks() {
    List<HabitModel> allHabits = getHabitCubit.habits;
    for (var i = 0; i < allHabits.length; i++) {
      if (allHabits[i].isFavourited) {
        if (!favHabits.contains(allHabits[i])) {
          favHabits.add(allHabits[i]);
        }
      }
    }
  }
}
