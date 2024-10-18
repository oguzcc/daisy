part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final SettingsModel settings;
  const SettingsState(this.settings);

  SettingsState.initial() : settings = SettingsModel();

  @override
  List<Object> get props => [settings];

  SettingsState copyWith({SettingsModel? settings}) =>
      SettingsState(settings ?? this.settings);

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      SettingsState(SettingsModel());

  Map<String, dynamic> toJson() => {'settings': settings};
}

class SettingsModel {}
