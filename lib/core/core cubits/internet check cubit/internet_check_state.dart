part of 'internet_check_cubit.dart';

@immutable
sealed class InternetCheckState {}

final class InternetCheckInitial extends InternetCheckState {}

final class InternetCheckConnected extends InternetCheckState {}

final class InternetCheckDisconnected extends InternetCheckState {}
