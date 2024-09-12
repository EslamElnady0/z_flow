part of 'dialog_cubit.dart';

@immutable
sealed class DialogState {}

final class DialogInitial extends DialogState {}

final class DialogChanged extends DialogState {}
