part of 'update_habit_cubit.dart';

@immutable
sealed class UpdateHabitState {}

final class UpdateHabitInitial extends UpdateHabitState {}

final class UpdateHabitLoading extends UpdateHabitState {}

final class UpdateHabitSuccess extends UpdateHabitState {}

final class UpdateHabitFailure extends UpdateHabitState {
  final String errMessage;

  UpdateHabitFailure(this.errMessage);
}
