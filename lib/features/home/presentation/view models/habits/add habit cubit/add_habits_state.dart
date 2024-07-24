part of 'add_habits_cubit.dart';

@immutable
sealed class AddHabitsState {}

final class AddHabitsInitial extends AddHabitsState {}

final class AddHabitsLoading extends AddHabitsState {}

final class AddHabitsSuccess extends AddHabitsState {}

final class AddHabitsFailure extends AddHabitsState {
  final String errMessage;
  AddHabitsFailure(this.errMessage);
}
