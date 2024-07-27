part of 'favourite_habits_cubit.dart';

@immutable
sealed class FavouriteHabitsState {}

final class FavouriteHabitsInitial extends FavouriteHabitsState {}

final class FavouriteHabitsSuccess extends FavouriteHabitsState {}
