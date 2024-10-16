part of '../group.dart';

class _GroupDropdown extends StatelessWidget {
  const _GroupDropdown(
      {required this.titles,
      required this.onPressCallbacks,
      this.hasCancelButton});

  final List<String> titles;
  final List<VoidCallback> onPressCallbacks;
  final bool? hasCancelButton;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        for (var i = 0; i < titles.length - 1; i++)
          CupertinoActionSheetAction(
            child: Text(titles[i]),
            onPressed: () {
              onPressCallbacks[i].call();
              Navigator.of(context).pop();
            },
          ),
      ],
      cancelButton: hasCancelButton ?? false
          ? CupertinoActionSheetAction(
              child: Text(titles.last),
              onPressed: () {
                onPressCallbacks.last.call();
                Navigator.of(context).pop();
              })
          : null,
    );
  }
}
