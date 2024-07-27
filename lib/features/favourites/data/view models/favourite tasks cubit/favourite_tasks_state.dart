part of 'favourite_tasks_cubit.dart';

@immutable
sealed class FavouriteTasksState {}

final class FavouriteTasksInitial extends FavouriteTasksState {}

final class FavouriteTasksSuccess extends FavouriteTasksState {}
