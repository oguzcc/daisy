import 'package:daisy/ui/util/size/app_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part '_button/_button_default.dart';
part '_button/_button_icon.dart';
part '_button/_button_with_icon.dart';

class Button extends StatelessWidget {
  const Button._(this.child);
  final Widget child;

  factory Button.elevated(
          {required String label, required VoidCallback onPressed}) =>
      Button._(_ButtonElevated(label: label, onPressed: onPressed));
  factory Button.filled(
          {required String label, required VoidCallback onPressed}) =>
      Button._(_ButtonFilled(label: label, onPressed: onPressed));
  factory Button.outlined(
          {required String label, required VoidCallback onPressed}) =>
      Button._(_ButtonOutlined(label: label, onPressed: onPressed));
  factory Button.text(
          {required String label, required VoidCallback onPressed}) =>
      Button._(_ButtonText(label: label, onPressed: onPressed));

  factory Button.iconBack({required VoidCallback onPressed}) =>
      Button._(_ButtonIconBack(onPressed: onPressed));
  factory Button.iconClose({required VoidCallback onPressed}) =>
      Button._(_ButtonIconClose(onPressed: onPressed));

  factory Button.icon(ButtonWithIconParam param) =>
      Button._(_ButtonWithIcon(param));
  factory Button.iconCircle(
          {required Widget icon, required VoidCallback onPressed}) =>
      Button._(_ButtonIconCircle(icon: icon, onPressed: onPressed));

  @override
  Widget build(BuildContext context) => child;
}

extension Modifier on Button {
  Widget fullWidth() => SizedBox(width: double.infinity, child: this);
  Widget expanded() => Expanded(child: this);
  Widget horMargin() =>
      Padding(padding: AppPadding.symmetric(levelHor: 1), child: this);
}
