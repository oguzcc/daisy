import 'package:daisy/ui/util/size/app_padding.dart';
import 'package:flutter/material.dart';

class Gap extends SizedBox {
  const Gap.shrink({super.key}) : super.shrink();
  const Gap.xxs({super.key}) : super(width: _v, height: _v);
  const Gap.xs({super.key}) : super(width: _v * 2, height: _v * 2);
  const Gap.sm({super.key}) : super(width: _v * 3, height: _v * 3);
  const Gap.md({super.key}) : super(width: _v * 4, height: _v * 4);
  const Gap.ml({super.key}) : super(width: _v * 5, height: _v * 5);
  const Gap.lg({super.key}) : super(width: _v * 6, height: _v * 6);
  const Gap.xl({super.key}) : super(width: _v * 7, height: _v * 7);
  const Gap.xxl({super.key}) : super(width: _v * 8, height: _v * 8);

  static const double _v = 4;
}

List<Widget> addGap(List<Widget> widgets, [Gap? gap]) {
  List<Widget> spacedWidgets = [];
  for (final widget in widgets) {
    spacedWidgets.addAll([widget, gap ?? const Gap.sm()]);
  }

  return spacedWidgets;
}

class GapColumn extends StatelessWidget {
  const GapColumn(
      {super.key,
      required this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.gap});

  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Gap? gap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: addGap(children, gap),
      ),
    );
  }
}

class GapRow extends StatelessWidget {
  const GapRow(
      {super.key,
      required this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.gap});

  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Gap? gap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.baseScaffold,
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children: addGap(children, gap),
        ),
      ),
    );
  }
}
