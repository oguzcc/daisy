part of '../indicator.dart';

class _IndicatorProgress extends StatelessWidget {
  const _IndicatorProgress(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context) => Center(child: child);
}

class _IndicatorProgressCircle extends StatelessWidget {
  const _IndicatorProgressCircle();

  @override
  Widget build(BuildContext context) =>
      const _IndicatorProgress(CircularProgressIndicator());
}

class _IndicatorProgressLinear extends StatelessWidget {
  const _IndicatorProgressLinear();

  @override
  Widget build(BuildContext context) =>
      const _IndicatorProgress(LinearProgressIndicator());
}
