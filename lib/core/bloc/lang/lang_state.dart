part of 'lang_cubit.dart';

@freezed
class LangState with _$LangState {
  const factory LangState({
    @Default(Locale('en')) Locale locale,
  }) = _LangState;
}
