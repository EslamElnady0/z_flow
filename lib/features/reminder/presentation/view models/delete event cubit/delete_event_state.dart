part of 'delete_event_cubit.dart';

@immutable
sealed class DeleteEventState {}

final class DeleteEventInitial extends DeleteEventState {}

final class DeleteEventLoading extends DeleteEventState {}

final class DeleteEventSuccess extends DeleteEventState {}

final class DeleteEventFailure extends DeleteEventState {
  final String message;
  DeleteEventFailure({required this.message});
}
