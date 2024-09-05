part of 'update_event_cubit.dart';

@immutable
sealed class UpdateEventState {}

final class UpdateEventInitial extends UpdateEventState {}

final class UpdateEventLoading extends UpdateEventState {}

final class UpdateEventSuccess extends UpdateEventState {}

final class UpdateEventFailure extends UpdateEventState {
  final String message;

  UpdateEventFailure({required this.message});
}
