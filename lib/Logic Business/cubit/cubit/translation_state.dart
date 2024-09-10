part of 'translation_cubit.dart';

@immutable
sealed class TranslationState {}

final class TranslationInitial extends TranslationState {}
final class ChangeTranslationState extends TranslationState {
  final Locale locale ;
  ChangeTranslationState({required this.locale});
}
