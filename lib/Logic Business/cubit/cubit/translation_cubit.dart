import 'package:app_localiz_cubit/Helper/cashed_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());

  Future<void>getSavedLanguage()async{
    final String cashedLanguageCode =await LanguageCashHelper().getCashedLanguageCode();
    emit(ChangeTranslationState(locale: Locale(cashedLanguageCode)));
  }

  Future<void>changeLanguageCode(String languageCode)async{
    await LanguageCashHelper().cashLanguageCode(languageCode);
    emit(ChangeTranslationState(locale: Locale(languageCode)));
  }
}
