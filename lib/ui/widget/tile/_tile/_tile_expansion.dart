part of '../tile.dart';

class _TileExpansion extends StatefulWidget {
  const _TileExpansion({
    required this.title,
    this.subtitle,
    required this.children,
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;

  @override
  State<_TileExpansion> createState() => _TileExpansionState();
}

class _TileExpansionState extends State<_TileExpansion> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(widget.title, style: context.text.bodyMedium),
        subtitle: widget.subtitle != null
            ? Text(widget.subtitle!, style: context.text.bodySmall)
            : null,
        trailing: Icon(
          _isExpanded.value
              ? CupertinoIcons.xmark_circle_fill
              : CupertinoIcons.add_circled_solid,
          size: 20,
          color: _isExpanded.value
              ? CupertinoColors.systemOrange
              : CupertinoColors.systemIndigo,
        ),
        onExpansionChanged: (bool isExpanded) {
          _isExpanded.value = isExpanded;
          setState(() {});
        },
        children: widget.children,
      ),
    );
  }
}
