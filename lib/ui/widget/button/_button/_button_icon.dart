part of '../button.dart';

class _ButtonIconBack extends _ButtonIcon {
  _ButtonIconBack({required VoidCallback onPressed})
      : super(
          ButtonIconParam(
            icon: CupertinoIcons.back,
            size: 24,
            onPressed: onPressed,
          ),
        );
}

class _ButtonIconClose extends _ButtonIcon {
  _ButtonIconClose({required VoidCallback onPressed})
      : super(
          ButtonIconParam(
            icon: CupertinoIcons.clear,
            size: 24,
            onPressed: onPressed,
          ),
        );
}

class _ButtonIconCircle extends StatelessWidget {
  const _ButtonIconCircle({required this.icon, required this.onPressed});

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent),
      onPressed: onPressed,
      child: icon,
    );
  }
}

class _ButtonIcon extends StatelessWidget {
  const _ButtonIcon(this.param);
  final ButtonIconParam param;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: param.onPressed,
      child: Icon(param.icon, size: param.size),
    );
  }
}

class ButtonIconParam {
  ButtonIconParam({
    required this.icon,
    required this.size,
    required this.onPressed,
  });
  final IconData icon;
  final double size;
  final VoidCallback onPressed;
}
