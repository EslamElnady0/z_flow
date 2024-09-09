part of 'get_links_lists_cubit.dart';

@immutable
sealed class GetLinksListsState {}

final class GetLinksListsInitial extends GetLinksListsState {}

final class GetLinksListsLoading extends GetLinksListsState {}

final class GetLinksListsSuccess extends GetLinksListsState {}

final class GetLinksListsFailure extends GetLinksListsState {
  final String message;

  GetLinksListsFailure({required this.message});
}
