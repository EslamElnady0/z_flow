part of 'add_tasks_category_cubit.dart';

@immutable
sealed class AddTasksCategoryState {}

final class AddTasksCategoryInitial extends AddTasksCategoryState {}

final class AddTasksCategoryLoading extends AddTasksCategoryState {}

final class AddTasksCategorySuccess extends AddTasksCategoryState {}

final class AddTasksCategoryFailure extends AddTasksCategoryState {
  final String errMessage;
  AddTasksCategoryFailure({required this.errMessage});
}
