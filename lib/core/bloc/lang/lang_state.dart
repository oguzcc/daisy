part of 'lang_cubit.dart';

class LangState extends Equatable {
  const LangState(this.locale);
  final Locale locale;

  factory LangState.initial() => LangState(const Locale('en', 'US'));

  @override
  List<Object> get props => [locale];

  LangState copyWith({Locale? locale}) => LangState(locale ?? this.locale);

  factory LangState.fromJson(Map<String, dynamic> json) =>
      LangState(Locale(json['languageCode'], json['countryCode']));

  Map<String, dynamic> toJson() =>
      {'languageCode': locale.languageCode, 'countryCode': locale.countryCode};
}
