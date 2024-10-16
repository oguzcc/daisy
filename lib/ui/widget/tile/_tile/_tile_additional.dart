part of '../tile.dart';

class _TileAdditional extends StatelessWidget {
  const _TileAdditional({
    required this.title,
    this.trailing,
    this.additionalInfo,
    this.onTap,
  });

  final String title;
  final String? additionalInfo;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(title, style: context.text.bodyMedium),
      additionalInfo: additionalInfo != null
          ? Flexible(
              fit: FlexFit.tight,
              child: Text(
                textAlign: TextAlign.end,
                additionalInfo!,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : null,
      trailing:
          trailing == null ? const Icon(CupertinoIcons.chevron_forward) : null,
      onTap: onTap,
    );
  }
}
