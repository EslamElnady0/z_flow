part of 'delete_task_category_cubit.dart';

@immutable
sealed class DeleteTaskCategoryState {}

final class DeleteTaskCategoryInitial extends DeleteTaskCategoryState {}

final class DeleteTaskCategoryLoading extends DeleteTaskCategoryState {}

final class DeleteTaskCategorySuccess extends DeleteTaskCategoryState {}

final class DeleteTaskCategoryFailure extends DeleteTaskCategoryState {
  final String errMessage;

  DeleteTaskCategoryFailure({required this.errMessage});
}
