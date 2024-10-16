import 'package:daisy/core/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part '_tile/_tile_additional.dart';
part '_tile/_tile_expansion.dart';
part '_tile/_tile_icon.dart';
part '_tile/_tile_list.dart';
part '_tile/_tile_swtch.dart';

class Tile extends StatelessWidget {
  const Tile._(this.tile);

  factory Tile.icon(
          {required String title,
          Color? color,
          IconData? prefixIcon,
          IconData? suffixIcon,
          required VoidCallback onTap}) =>
      Tile._(_TileIcon(
          title: title,
          color: color,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          onTap: onTap));

  factory Tile.list({
    required String title,
    String? subtitle,
    Widget? prefix,
    IconData? suffix,
    VoidCallback? onSuffixTap,
    Color? textColor,
  }) {
    assert(onSuffixTap != null ? suffix != null : true,
        'onSuffixTap and suffix must be provided together');
    return Tile._(_TileList(
      title: title,
      subtitle: subtitle,
      prefix: prefix,
      suffix: suffix,
      onSuffixTap: onSuffixTap,
      textColor: textColor,
    ));
  }

  factory Tile.expansion({
    required String title,
    String? subtitle,
    required List<Widget> children,
  }) {
    return Tile._(_TileExpansion(
      title: title,
      subtitle: subtitle,
      children: children,
    ));
  }

  factory Tile.additional({
    required String title,
    Widget? trailing,
    String? additionalInfo,
    VoidCallback? onTap,
  }) =>
      Tile._(_TileAdditional(
          title: title,
          trailing: trailing,
          additionalInfo: additionalInfo,
          onTap: onTap));

  factory Tile.swtch({
    required String title,
    IconData? prefixIcon,
    required ValueSetter<bool> onChanged,
    required bool value,
  }) =>
      Tile._(_TileSwtch(
        title: title,
        prefixIcon: prefixIcon,
        onChanged: onChanged,
        value: value,
      ));

  final Widget tile;

  @override
  Widget build(BuildContext context) {
    return tile;
  }
}
