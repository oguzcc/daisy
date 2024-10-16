part of '../group.dart';

class _Section extends StatelessWidget {
  const _Section({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.group,
      child: CupertinoListSection.insetGrouped(
          margin: EdgeInsets.zero, children: children),
    );
  }
}
