import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/core/utils/helper%20enums/language_enum.dart';
import 'package:z_flow/core/utils/shared_pref_helper.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  changeAppLanguage(LanguageEnum languageEnum) async {
    switch (languageEnum) {
      case LanguageEnum.initialLang:
        if (await SharedPrefHelper.getString("lang") != null) {
          if (await SharedPrefHelper.getString("lang") == "ar") {
            emit(LocalizationChanged(languageCode: "ar"));
          } else {
            SharedPrefHelper.setData("lang", "en");
            emit(LocalizationChanged(languageCode: "en"));
          }
        } else {
          SharedPrefHelper.setData("lang", "en");
          emit(LocalizationChanged(languageCode: "en"));
        }
        break;
      case LanguageEnum.english:
        SharedPrefHelper.setData("lang", "en");
        emit(LocalizationChanged(languageCode: "en"));
        break;
      case LanguageEnum.arabic:
        SharedPrefHelper.setData("lang", "ar");
        emit(LocalizationChanged(languageCode: "ar"));
        break;
      default:
        SharedPrefHelper.setData("lang", "en");
        emit(LocalizationChanged(languageCode: "en"));
    }
  }
}
