part of 'select_task_categories_cubit.dart';

@immutable
sealed class SelectTaskCategoriesState {}

final class SelectTaskCategoriesInitial extends SelectTaskCategoriesState {}

final class SelectTaskCategoriesSelected extends SelectTaskCategoriesState {}

final class SelectTaskCategoriesAdd extends SelectTaskCategoriesState {}
