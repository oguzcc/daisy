import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Returns the [ThemeData] associated with the current [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] defined in the current [ThemeData].
  TextTheme get text => theme.textTheme;

  /// Returns the [ColorScheme] defined in the current [ThemeData].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Brightness
  Brightness get brightness => theme.brightness;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// Returns the [MediaQueryData] associated with the current [BuildContext].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the [Navigator] associated with the current [BuildContext].
  NavigatorState get navigator => Navigator.of(this);

  /// Returns the [FocusScopeNode] associated with the current [BuildContext].
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Unfocus
  void get unfocus => FocusScope.of(this).unfocus();

  /// back
  void onTapBack() => Navigator.pop(this);

  void onTapBackWithResult(dynamic result) => Navigator.pop(this, result);

  ///GoRouter
  void popUntil(String routeName) {
    Navigator.popUntil(
      this,
      (route) => route.settings.name == routeName,
    );
  }

  /// Returns the [ScaffoldState] associated with the current [BuildContext].
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Returns the [ScaffoldMessengerState]
  /// associated with the current [BuildContext].
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Returns the height of the current widget's [MediaQuery].
  double get height => mediaSize.height;

  /// Returns the width of the current widget's [MediaQuery].
  double get width => mediaSize.width;

  /// Calculates and returns a dynamic width value
  /// based on the provided [val] and the current widget's width.
  double dynamicWidth(double val) => width * val;

  /// Calculates and returns a dynamic height value
  /// based on the provided [val] and the current widget's height.
  double dynamicHeight(double val) => height * val;

  /// Returns the [Size] associated with the current [BuildContext].
  Size get mediaSize => MediaQuery.sizeOf(this);

  /// Returns the [Size] associated with the current [BuildContext].
  EdgeInsets get mediaViewInset => MediaQuery.viewInsetsOf(this);

  /// Returns the [Brightness] associated with the current [BuildContext].
  Brightness get mediaBrightness => MediaQuery.platformBrightnessOf(this);

  /// Returns the primary [TextTheme] defined in the current [ThemeData].
  // TextTheme get text => theme.textTheme;

  /// Returns a random [MaterialColor]
  /// from the predefined list of primary colors.
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  /// Returns whether the software keyboard is open,
  /// based on the bottom insets of the current
  /// [MediaQueryData].
  bool get isKeyBoardOpen => mediaViewInset.bottom > 0;

  /// Returns the height of the software keyboard,
  /// based on the bottom insets of the current
  /// [MediaQueryData].
  double get keyboardPadding => mediaViewInset.bottom;

  /// this is come from old invoice app
  Future<bool> isInternetAvailable() async {
    try {
      const String checkInternetURL = 'google.com';
      final result = await InternetAddress.lookup(checkInternetURL);
      final isActive =
          result.isNotEmpty && result[0].rawAddress.isNotEmpty ? true : false;

      return isActive;
    } on SocketException catch (_) {
      return false;
    }
  }
}
