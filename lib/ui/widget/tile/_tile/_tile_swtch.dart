part of '../tile.dart';

class _TileSwtch extends StatelessWidget {
  const _TileSwtch({
    required this.title,
    this.prefixIcon,
    required this.onChanged,
    required this.value,
  });

  final String title;
  final IconData? prefixIcon;
  final ValueSetter<bool> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(title, style: context.text.bodyMedium),
      leading: Icon(prefixIcon ?? CupertinoIcons.bell),
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
