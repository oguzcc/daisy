# daisy

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

## Running the app

To run the app, open run and debug section in your IDE and select the desired device and press the run button.

## Flavor

This project uses [Flutter Flavorizr](https://pub.dev/packages/flutter_flavorizr) package to manage the different flavors.

To generate the flavors, run the following command:

```bash
flutter pub run flutter_flavorizr
```

And then, replace `main.dart` with this code below:

```dart
import 'dart:async';

import 'package:daisy/app/app.dart';
import 'package:daisy/app/bootstrap.dart';

FutureOr<void> main() async {
  bootstrap(() => const App());
}
```

## Mason

This project uses Mason to generate code. To generate the code, run the following command:

First, install Mason CLI:

```bash
dart pub global activate mason_cli
```

Then, run the following command:

```bash
mason make <brick-name> -o <output-dir>
```

## Router

This project uses GoRouter for navigation.

We can use two types of bottom navigation bars:

1. StatefulShellRoute for bottom navigation bar with stateful pages. This is useful when we want to keep the state of the pages.
2. ShellRoute for bottom navigation bar with stateless pages. This is useful when we don't want to keep the state of the pages.

## Theme

This project uses Material Theme Builder theme to manage the colors and text styles.

To generate the theme, go to the following link:

[Material Theme Builder](https://material-foundation.github.io/material-theme-builder/)

Then, copy the generated code and paste it in the `theme.dart` file.

## Font

This project uses Google Fonts to manage the fonts.

To generate the font, go to `app.dart` and change font family to the desired font.

## Flutter Launcher Icon

This project uses [Flutter Launcher Icon](https://pub.dev/packages/flutter_launcher_icons) package to manage the app icons.

To generate the app icons, first paste your app logo instead of
`assets/image/app_logo.png` and then run the following command:

```bash
flutter pub get
dart run flutter_launcher_icons
```

## Localization

This project uses [Easy Localization](https://pub.dev/packages/easy_localization) package to manage the localization.

To generate the localization,
First add your strings to the `assets/translation` folder and then

run the following command:

```bash
dart run easy_localization:generate -O lib/localization/locale_keys -f keys -o locale_keys.g.dart -S assets/translation
```

or

`script/lang.sh`

then use strings like this:

```dart
import 'package:daisy/core/extension/string_extension.dart';

Text(LocaleKeys.helloWorld.t)
```
