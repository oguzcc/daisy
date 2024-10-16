// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

sealed class AssetManager {
  String getFlag(String code) => code.toFlag;

  // Flag
  // static final us = 'us'.toFlag;

  // Icon
  // static final exampleIcon = 'example_icon'.toSvg;

  // Social Icon
  // static final google = 'google_filled'.toSocialIcon;

  // Image
  // static final appLogo = 'app_logo'.toPng;

  // Video
  static final introVideo = 'intro_video'.toMp4;
}

extension AssetPath on String {
  String get toFlag => 'assets/flag/$this.png';
  String get toSvg => 'assets/icon/$this.svg';
  String get toPng => 'assets/image/$this.png';
  String get toMp4 => 'assets/video/$this.mp4';
  String get toSocialIcon => 'assets/social/$this.svg';
}

extension ImageExtension on String {
  Widget svg(
      {double? height,
      double? width,
      Color? color,
      EdgeInsets? padding,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SvgPicture.asset(
          this,
          height: height,
          width: width,
          theme: SvgTheme(currentColor: color ?? Colors.transparent),
        ),
      ),
    );
  }
}
