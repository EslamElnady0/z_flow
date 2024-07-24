part of 'add_habits_cubit.dart';

@immutable
sealed class AddHabitsState {}

final class AddHabitInitial extends AddHabitsState {}

final class AddHabitLoading extends AddHabitsState {}

final class AddHabitSuccess extends AddHabitsState {}

final class AddHabitFailure extends AddHabitsState {
  final String errMessage;
  AddHabitFailure(this.errMessage);
}
