part of 'get_tasks_categories_cubit.dart';

@immutable
sealed class GetTasksCategoriesState {}

final class GetTasksCategoriesInitial extends GetTasksCategoriesState {}

final class GetTasksCategoriesLoading extends GetTasksCategoriesState {}

final class GetTasksCategoriesSuccess extends GetTasksCategoriesState {
  final List<String> cats;
  GetTasksCategoriesSuccess({required this.cats});
}

final class GetTasksCategoriesFailure extends GetTasksCategoriesState {
  final String errMessage;
  GetTasksCategoriesFailure({required this.errMessage});
}
