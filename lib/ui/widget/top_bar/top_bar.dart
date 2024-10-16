import 'package:daisy/ui/util/size/app_padding.dart';
import 'package:daisy/ui/widget/gap/gap.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    super.key,
    required this.title,
    this.leading,
    this.action,
    this.bottom,
    this.toolbarHeight,
  });

  final Widget title;
  final Widget? leading;
  final Widget? action;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      leading: Padding(
        padding: AppPadding.appBar * 1.8,
        child: leading ?? const Gap.shrink(),
      ),
      title: title,
      actions: [
        if (action != null)
          Padding(padding: AppPadding.onlyRight(4), child: action),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        preferredHeightFor(
          _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        ),
      );

  static double preferredHeightFor(Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize &&
        preferredSize.toolbarHeight == null) {
      return (kToolbarHeight) + (preferredSize.bottomHeight ?? 0);
    }
    return preferredSize.height;
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
