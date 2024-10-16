import 'package:flutter/material.dart';

import 'api_options.dart';

enum EnvType { development, staging, production }

/// FlavorConfig to configure flavors
class AppFlavor {
  /// Factory constructor
  factory AppFlavor({
    String? name,
    Color color = Colors.red,
    BannerLocation location = BannerLocation.topStart,
    IApiOption? apiOptions,
    Map<String, dynamic> variables = const {},
  }) {
    _instance = AppFlavor._internal(
      name,
      color,
      location,
      apiOptions,
      variables,
    );

    return _instance!;
  }
  factory AppFlavor.instance() {
    _instance ??= AppFlavor();
    return _instance!;
  }

  /// Private constructor
  AppFlavor._internal(
    this.name,
    this.color,
    this.location,
    this.apiOptions,
    this.variables,
  );

  /// Name of flavor
  final String? name;

  /// Color of the banner
  final Color color;

  /// Location of the banner
  final BannerLocation location;

  /// Variables are dynamic
  final Map<String, dynamic> variables;
  final IApiOption? apiOptions;

  /// Internal instance of FlavorConfig
  static AppFlavor? _instance;
}
