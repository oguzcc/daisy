// ignore_for_file: unused_element

import 'package:flutter/material.dart';

sealed class AppRadius {
  static final button = _RadiusConstant.sm();
  static final input = _RadiusConstant.sm();
  static final card = _RadiusConstant.sm();
  static final group = _RadiusConstant.sm();
  static final textField = _RadiusConstant.xs();
  static final tab = _RadiusConstant.sm();
  static final pdf = _RadiusConstant.xxs();
  static final image = _RadiusConstant.sm();
  static final sheet = _RadiusConstant.sm();
  static final circular = _RadiusConstant.circular();
}

final class _RadiusConstant extends BorderRadius {
  _RadiusConstant.xxs() : super.circular(_value);
  _RadiusConstant.xs() : super.circular(_value * 2);
  _RadiusConstant.sm() : super.circular(_value * 3);
  _RadiusConstant.md() : super.circular(_value * 4);
  _RadiusConstant.lg() : super.circular(_value * 5);
  _RadiusConstant.xl() : super.circular(_value * 6);
  _RadiusConstant.xxl() : super.circular(_value * 7);
  _RadiusConstant.l3x() : super.circular(_value);

  _RadiusConstant.circular() : super.circular(_value * 25);

  static const double _value = 4;
}
