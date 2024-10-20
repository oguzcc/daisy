import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String overflow(int length) {
    return this.length > length ? '${substring(0, length)}...' : this;
  }

  bool get isNumber {
    if (isEmpty) {
      return false;
    }
    final number = double.tryParse(this);
    return number != null;
  }
}

extension NullableString on String? {
  double? convertToDouble() {
    if (this == null || this!.isEmpty) {
      return null;
    }
    return double.tryParse(this!);
  }

  bool isNotNullOrEmpty() => this != null && this!.isNotEmpty;
}

extension LocalizationExtension on String {
  String get t => this.tr();
}
