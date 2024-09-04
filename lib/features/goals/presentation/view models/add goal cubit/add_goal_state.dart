part of 'add_goal_cubit.dart';

@immutable
sealed class AddGoalState {}

final class AddGoalInitial extends AddGoalState {}

final class AddGoalLoading extends AddGoalState {}

final class AddGoalSuccess extends AddGoalState {}

final class AddGoalFailure extends AddGoalState {
  final String message;
  AddGoalFailure({required this.message});
}
