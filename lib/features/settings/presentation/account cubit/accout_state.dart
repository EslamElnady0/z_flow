part of 'accout_cubit.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountSuccess extends AccountState {
  final String? imageUrl;
  AccountSuccess({this.imageUrl});
}

final class AccountFailure extends AccountState {
  final String errMessage;
  AccountFailure({required this.errMessage});
}
