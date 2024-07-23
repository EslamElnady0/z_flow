part of 'get_task_cubit.dart';

@immutable
sealed class GetTaskState {}

final class GetTaskInitial extends GetTaskState {}

final class GetTaskLoading extends GetTaskState {}

final class GetTaskSuccess extends GetTaskState {}

final class GetTaskFailure extends GetTaskState {
  final String errMessage;

  GetTaskFailure(this.errMessage);
}
