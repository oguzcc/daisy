part of '../empty.dart';

class EmptyAvatar extends StatelessWidget {
  const EmptyAvatar({super.key, this.size = SizeEnum.md});

  final SizeEnum? size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colorScheme.surface,
      radius: size == SizeEnum.xs
          ? 20.0
          : size == SizeEnum.sm
              ? 30.0
              : 40.0,
      child: Icon(
        CupertinoIcons.person_fill,
        size: size == SizeEnum.xs
            ? 20.0
            : size == SizeEnum.sm
                ? 30.0
                : 40.0,
        color: Colors.grey[600],
      ),
    );
  }
}

enum SizeEnum { xs, sm, md, lg, xl }
