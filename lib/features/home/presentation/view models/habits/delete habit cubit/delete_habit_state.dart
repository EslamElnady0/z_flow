part of 'delete_habit_cubit.dart';

@immutable
sealed class DeleteHabitState {}

final class DeleteHabitInitial extends DeleteHabitState {}

final class DeleteHabitLoading extends DeleteHabitState {}

final class DeleteHabitSuccess extends DeleteHabitState {}

final class DeleteHabitFailure extends DeleteHabitState {
  final String errMessage;
  DeleteHabitFailure(this.errMessage);
}
