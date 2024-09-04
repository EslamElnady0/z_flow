part of 'edit_goal_cubit.dart';

@immutable
sealed class EditGoalState {}

final class EditGoalInitial extends EditGoalState {}

final class EditGoalLoading extends EditGoalState {}

final class EditGoalSuccess extends EditGoalState {}

final class EditGoalFailure extends EditGoalState {
  final String message;

  EditGoalFailure({required this.message});
}
