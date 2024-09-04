part of 'get_goals_cubit.dart';

@immutable
sealed class GetGoalsState {}

final class GetGoalsInitial extends GetGoalsState {}

final class GetGoalsLoading extends GetGoalsState {}

final class GetGoalsSuccess extends GetGoalsState {}

final class GetGoalsFailure extends GetGoalsState {
  final String message;
  GetGoalsFailure({required this.message});
}
