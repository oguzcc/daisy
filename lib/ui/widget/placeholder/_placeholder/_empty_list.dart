part of '../empty.dart';

class _EmptyList extends StatelessWidget {
  const _EmptyList(this.param);
  final EmptyListParam param;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: param.padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: context.width * 0.44,
            child: param.svgPath.svg(),
          ),
          Text(param.title,
              style: context.text.bodyMedium, textAlign: TextAlign.center),
          const Gap.xs(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: param.onTapButton,
              child: Text(param.buttonText),
            ),
          )
        ],
      ),
    );
  }
}

class EmptyListParam {
  final String title;
  final VoidCallback onTapButton;
  final String buttonText;
  final String svgPath;
  final EdgeInsets? padding;
  const EmptyListParam(
      {required this.title,
      required this.onTapButton,
      required this.buttonText,
      required this.svgPath,
      this.padding});
}
