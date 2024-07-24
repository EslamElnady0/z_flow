part of 'get_habit_cubit.dart';

@immutable
sealed class GetHabitState {}

final class GetHabitInitial extends GetHabitState {}

final class GetHabitLoading extends GetHabitState {}

final class GetHabitSucuess extends GetHabitState {}

final class GetHabitFailure extends GetHabitState {
  final String errMessage;

  GetHabitFailure(this.errMessage);
}
