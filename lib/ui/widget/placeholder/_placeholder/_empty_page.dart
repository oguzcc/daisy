part of '../empty.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key, required this.message, this.color});

  final String message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: context.text.bodyLarge
                ?.copyWith(color: color ?? context.colorScheme.onSurface),
          ),
          Icon(CupertinoIcons.exclamationmark_circle_fill,
              size: 64, color: color ?? context.colorScheme.onSurface),
        ],
      ),
    );
  }
}
