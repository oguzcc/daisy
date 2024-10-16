part of '../picker.dart';

class _PickerImage extends StatefulWidget {
  const _PickerImage({required this.onImagePicked});
  final ValueSetter<XFile?> onImagePicked;

  @override
  State<_PickerImage> createState() => _PickerImageState();
}

class _PickerImageState extends State<_PickerImage> {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> pickFromGallery() async {
    return picker.pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> pickFromCamera() async {
    return picker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        child: const Text(Strings.cancel, style: TextStyle(color: Colors.red)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        ColoredBox(
          color: Colors.white,
          child: CupertinoActionSheetAction(
            child: const Text(Strings.openGallery),
            onPressed: () async {
              Navigator.of(context).pop();
              await pickFromGallery()
                  .then((value) => widget.onImagePicked(value));
            },
          ),
        ),
        ColoredBox(
          color: Colors.white,
          child: CupertinoActionSheetAction(
            child: const Text(Strings.openCamera),
            onPressed: () async {
              Navigator.of(context).pop();
              await pickFromCamera()
                  .then((value) => widget.onImagePicked(value));
            },
          ),
        ),
      ],
    );
  }
}
