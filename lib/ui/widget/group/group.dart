import 'package:daisy/ui/util/size/app_radius.dart';
import 'package:flutter/cupertino.dart';

part '_group/_group_dropdown.dart';
part '_group/_group_section.dart';

class Group extends StatelessWidget {
  const Group._(this.child);
  final Widget child;

  factory Group.section({required List<Widget> children}) =>
      Group._(_Section(children: children));
  factory Group.dropdown({
    required List<String> titles,
    required List<VoidCallback> onPressedCallbacks,
    bool? hasCancelButton,
  }) =>
      Group._(_GroupDropdown(
          titles: titles,
          onPressCallbacks: onPressedCallbacks,
          hasCancelButton: hasCancelButton));

  @override
  Widget build(BuildContext context) => child;
}
