part of 'get_events_cubit.dart';

@immutable
sealed class GetEventsState {}

final class GetEventsInitial extends GetEventsState {}

final class GetEventsLoading extends GetEventsState {}

final class GetEventsSuccess extends GetEventsState {}

final class GetEventsFailure extends GetEventsState {
  final String message;

  GetEventsFailure({required this.message});
}

final class DaySelectedState extends GetEventsState {}
