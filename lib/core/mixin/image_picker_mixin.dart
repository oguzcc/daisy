import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin ImagePickerMixin {
  final ImagePicker picker = ImagePicker();

  void onTapCamera(BuildContext context) =>
      pickImage(ImageSource.camera, context);

  void onTapGallery(BuildContext context) =>
      pickImage(ImageSource.gallery, context);

  Future<void> pickImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    File? file;
    if (pickedFile != null) {
      file = File(pickedFile.path);
    }
    if (context.mounted) Navigator.pop(context, file);
  }
}
