part of 'delete_goal_cubit.dart';

@immutable
sealed class DeleteGoalState {}

final class DeleteGoalInitial extends DeleteGoalState {}

final class DeleteGoalLoading extends DeleteGoalState {}

final class DeleteGoalSuccess extends DeleteGoalState {}

final class DeleteGoalFailure extends DeleteGoalState {
  final String message;

  DeleteGoalFailure({required this.message});
}
