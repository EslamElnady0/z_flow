part of 'log_in_ano_cubit.dart';

@immutable
sealed class LogInAnoState {}

final class LogInAnoInitial extends LogInAnoState {}

final class LogInAnoLoading extends LogInAnoState {}

final class LogInAnoSuccess extends LogInAnoState {}

final class LogInAnoFailure extends LogInAnoState {
  final String errMessage;

  LogInAnoFailure(this.errMessage);
}
