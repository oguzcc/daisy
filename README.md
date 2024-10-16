# daisy

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

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
