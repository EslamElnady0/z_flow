part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationChanged extends LocalizationState {
  final String? languageCode;

  LocalizationChanged({required this.languageCode});
}
