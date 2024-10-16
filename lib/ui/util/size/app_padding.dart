// ignore_for_file: unused_element

import 'package:flutter/material.dart';

sealed class AppPadding {
  static const baseScaffold = _PaddingConstant.md();
  static const appBar = _PaddingConstant.xs();
  static const button = _PaddingConstant.md();
  static const card = _PaddingConstant.md();
  static const dialog = _PaddingConstant.xs();
  static const bottomBar = _PaddingConstant.xs();
  static const tile = _PaddingConstant.md();
  static const icon = _PaddingConstant.xxs();
  static const bottomButton = _PaddingConstant.bottomButton();

  static all(int level) => _PaddingConstant.all(level);
  static const btnSocial = _PaddingConstant.btnSocial();

  static symmetric({int levelHor = 0, int levelVer = 0}) =>
      _PaddingConstant.symmetric(levelHor: levelHor, levelVer: levelVer);

  static horizontal(int level) => _PaddingConstant.symmetricHorizontal(level);
  static vertical(int level) => _PaddingConstant.symmetricVertical(level);

  static onlyTop(int level) => _PaddingConstant.onlyTop(level);
  static onlyBottom(int level) => _PaddingConstant.onlyBottom(level);
  static onlyLeft(int level) => _PaddingConstant.onlyLeft(level);
  static onlyRight(int level) => _PaddingConstant.onlyRight(level);
}

final class _PaddingConstant extends EdgeInsets {
  const _PaddingConstant.xxs() : super.all(_value);
  const _PaddingConstant.xs() : super.all(_value * 2);
  const _PaddingConstant.sm() : super.all(_value * 3);
  const _PaddingConstant.md() : super.all(_value * 4);
  const _PaddingConstant.lg() : super.all(_value * 5);
  const _PaddingConstant.xl() : super.all(_value * 6);
  const _PaddingConstant.xxl() : super.all(_value * 7);
  const _PaddingConstant.xl3() : super.all(_value);

  const _PaddingConstant.all(int level)
      : assert(level > 0),
        super.all(_value * level);

  const _PaddingConstant.symmetric({int levelHor = 0, int levelVer = 0})
      : assert(levelHor > 0 && levelVer > 0),
        super.symmetric(
            horizontal: _value * levelHor, vertical: _value * levelVer);
  const _PaddingConstant.symmetricHorizontal(int level)
      : assert(level > 0),
        super.symmetric(horizontal: _value * level);
  const _PaddingConstant.symmetricVertical(int level)
      : assert(level > 0),
        super.symmetric(vertical: _value * level);

  const _PaddingConstant.onlyTop(int level)
      : assert(level > 0),
        super.only(top: _value * level);
  const _PaddingConstant.onlyBottom(int level)
      : assert(level > 0),
        super.only(bottom: _value * level);
  const _PaddingConstant.onlyLeft(int level)
      : assert(level > 0),
        super.only(left: _value * level);
  const _PaddingConstant.onlyRight(int level)
      : assert(level > 0),
        super.only(right: _value * level);

  const _PaddingConstant.btnSocial()
      : super.symmetric(horizontal: 12, vertical: 12);
  const _PaddingConstant.bottomButton() : super.fromLTRB(20, 0, 20, 24);

  static const double _value = 4;
}
