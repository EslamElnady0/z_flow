part of 'add_event_cubit.dart';

@immutable
sealed class AddEventState {}

final class AddEventInitial extends AddEventState {}

final class AddEventLoading extends AddEventState {}

final class AddEventSuccess extends AddEventState {}

final class AddEventFailure extends AddEventState {
  final String message;

  AddEventFailure({required this.message});
}
