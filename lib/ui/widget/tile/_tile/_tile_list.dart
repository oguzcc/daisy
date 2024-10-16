part of '../tile.dart';

class _TileList extends StatelessWidget {
  const _TileList({
    required this.title,
    this.subtitle,
    this.prefix,
    this.suffix,
    this.onSuffixTap,
    this.textColor,
  });

  final String title;
  final String? subtitle;
  final Widget? prefix;
  final IconData? suffix;
  final VoidCallback? onSuffixTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
        title: Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: textColor),
        ),
        subtitle: Text(
          subtitle ?? '',
          style: TextStyle(color: textColor),
        ),
        leading: Align(
          alignment: Alignment.center,
          child: prefix,
        ),
        trailing: IconButton(
          onPressed: onSuffixTap,
          icon: Icon(suffix),
        ));
  }
}
