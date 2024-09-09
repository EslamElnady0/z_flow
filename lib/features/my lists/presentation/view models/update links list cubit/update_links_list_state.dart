part of 'update_links_list_cubit.dart';

@immutable
sealed class UpdateLinksListState {}

final class UpdateLinksListInitial extends UpdateLinksListState {}

final class UpdateLinksListLoading extends UpdateLinksListState {}

final class UpdateLinksListSuccess extends UpdateLinksListState {}

final class UpdateLinksListFailure extends UpdateLinksListState {
  final String message;

  UpdateLinksListFailure({required this.message});
}
