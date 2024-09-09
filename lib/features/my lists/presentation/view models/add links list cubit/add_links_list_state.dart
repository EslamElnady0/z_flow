part of 'add_links_list_cubit.dart';

@immutable
sealed class AddLinksListState {}

final class AddLinksListInitial extends AddLinksListState {}

final class AddLinksListLoading extends AddLinksListState {}

final class AddLinksListSuccess extends AddLinksListState {}

final class AddLinksListFailure extends AddLinksListState {
  final String message;

  AddLinksListFailure({required this.message});
}
