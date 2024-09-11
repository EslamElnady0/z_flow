part of 'accout_cubit.dart';

@immutable
sealed class AccoutState {}

final class AccoutInitial extends AccoutState {}

final class AccoutLoading extends AccoutState {}

final class AccoutSuccess extends AccoutState {
  final String? imageUrl;
  AccoutSuccess({this.imageUrl});
}

final class AccoutFailure extends AccoutState {
  final String errMessage;
  AccoutFailure({required this.errMessage});
}
