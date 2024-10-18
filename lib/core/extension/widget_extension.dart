import 'package:flutter/material.dart';

/// Beli widgetin ggörünürlük durumunu değiştirmek için kullanılır
extension WidgetExtension on Widget {
  Widget isVisible(bool value,
          {double? height, double? width, Widget? child}) =>
      value ? this : (child ?? SizedBox(height: height, width: width));

  Widget isFiltered(bool value, ColorFilter colorFilter) =>
      value ? ColorFiltered(colorFilter: colorFilter, child: this) : this;

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);
}
